import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../Widgets/Widgets.dart';
import '../../config/config.dart';
import '../../core/utils/getStorage.dart';
import '../../core/utils/navigationService.dart';
import '../../routes/appRoutes.dart';
import '../models/http/httpResult.dart';

/// HTTP service
class HttpService {
  static final HttpService _instance = HttpService._privateConstructor();
  /// public instance
  static HttpService get instance => _instance;
  final GetStorage _cacheStorage = GetStorage(); // Use GetStorage for cache

  HttpService._privateConstructor();

  Future<bool> _isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }
/// no internet connection
  final HttpResult _noInternetConnection = const HttpResult(
    code: 503,
    message: 'No internet connection',
  );

  /// on token error
  void _onTokenError() {
    Widgets.showToast('Session expired, please login again');
    AppGetXStorage.logout();
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.initialRoute);
  }
  /// Get request with cache support
  Future<HttpResult> getRequest(String url, {Map<String, String>? headers, bool useCache = false}) async {
    if (!await _isConnected()) {
      return _getCachedResponse(url) ?? _noInternetConnection;
    }

    if (useCache) {
      final cachedResponse = _getCachedResponse(url);
      if (cachedResponse != null) {
        return cachedResponse;
      }
    }

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      // Save to cache
      _saveResponseToCache(url, response.body);
    }
     if (response.statusCode == 401 || response.statusCode == 403) {
      _onTokenError();
    }

    return _handleResponse(response);
  }

  /// POST request
  Future<http.Response> postRequest(String url, {Map<String, String>? headers, dynamic body, bool useCache = false}) async {
    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200 && useCache) {
      // Optionally cache POST responses
      _saveResponseToCache(url, response.body);
    }

    return response;
  }

  /// Cache response
  void _saveResponseToCache(String url, String responseBody) {
    final cacheData = {
      'response': responseBody,
      'timestamp': DateTime.now().toIso8601String(),
    };
    _cacheStorage.write(url, json.encode(cacheData));
  }

  /// Get cached response if available and valid
  HttpResult? _getCachedResponse(String url) {
  final cacheData = _cacheStorage.read(url);
  if (cacheData != null) {
    final cachedMap = json.decode(cacheData);
    final cacheTime = DateTime.parse(cachedMap['timestamp']);
    if (DateTime.now().difference(cacheTime) < Config.cacheDuration) {
      print('Returning cached response');
      return HttpResult(
        code: 200, // Assuming cached data is successful
        message: 'OK',
        responseString: cachedMap['response'],
      ); // Construct and return HttpResult directly from cache
    } else {
      _cacheStorage.remove(url); // Cache expired, remove it
    }
  }
  return null; // No valid cache found
}
   /// Handles the response and maps status codes to appropriate messages.
  HttpResult _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return _getResult(response);
      case 400:
        return HttpResult(
          code: 400,
          message: 'Bad Request',
          responseString: response.body,
        );
      case 401:
        return HttpResult(
          code: 401,
          message: 'Unauthorized',
          responseString: response.body,
        );
      case 403:
        return HttpResult(
          code: 403,
          message: 'Forbidden',
          responseString: response.body,
        );
      case 404:
        return HttpResult(
          code: 404,
          message: 'Not Found',
          responseString: response.body,
        );
      case 500:
        return HttpResult(
          code: 500,
          message: 'Internal Server Error',
          responseString: response.body,
        );
      default:
        return HttpResult(
          code: response.statusCode,
          message: response.reasonPhrase ?? 'Unknown error',
          responseString: response.body,
        );
    }
  }

  /// Creates an instance of `HttpResult` by extracting the status code, reason phrase, and response body from the given `http.Response` object.
  static HttpResult _getResult(http.Response response) {
    return HttpResult.create(
      code: response.statusCode,
      message: response.reasonPhrase,
      responseString: response.body,
    );
  }
}
