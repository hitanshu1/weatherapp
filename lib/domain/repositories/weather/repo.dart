

import '../../../Widgets/Widgets.dart';
import '../../../data/data_sources/http_source.dart';
import '../../../data/models/weather/hourlyWeather.dart';
import '../../../data/models/weather/weather.dart';
import '../../../data/models/weather/weeklyWeather.dart';
import '../../apiUrls.dart';

/// weather repository
class WeatherRepository {
  WeatherRepository._();

  ///  private instance
  static final WeatherRepository _instance = WeatherRepository._();

  /// instance
  static WeatherRepository get instance => _instance;

  /// http source
  final HttpService _httpService = HttpService.instance;

  /// get weather from coordinates
  Future<WeatherModel?> getWeatherFromCoordinates(
      double lat, double lon) async {
    final response = await _httpService.getRequest(
        Apiurls.weatherUrlFromCoordinates(lat: lat, lon: lon),
        useCache: true);
    if (response.isSuccess) {
      return WeatherModel.fromJson(response.json);
    } else {
      Widgets.showToast(response.message, error: true);
      return null;
    }
  }

  /// get weather
  Future<WeatherModel?> getWeather(String cityName) async {
    final response = await _httpService
        .getRequest(Apiurls.weatherUrl(city: cityName), useCache: true);
        print('response ${response.json}');
    if (response.isSuccess) {
      return WeatherModel.fromJson(response.json);
    } else {
      if (response.code == 404) {
         Widgets.showToast('City not found', error: true);
      }else{
         Widgets.showToast(response.message, error: true);
      }
     
      return null;
    }
  }

  /// weather forecast by city
  Future<List<WeatherModel>> get5DayForecastByCity(String city) async {
    
    final response =
        await _httpService.getRequest(Apiurls.forecastUrl(city: city), useCache: true);

    print(response.json);


    if (response.isSuccess) {

      return (response.json['list'] as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList();
    } else {
      Widgets.showToast(response.message, error: true);
      return [];
    }
  }
  /// weather forecast by coordinates
  Future<List<WeatherModel>> get5DayForecastByCoordinates(
      double lat, double lon) async {
    final response = await _httpService
        .getRequest(Apiurls.forecastUrlByCoordinates(lat: lat, lon: lon), useCache: true);
    if (response.isSuccess) {
      return (response.json['list'] as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList();
    } else {
      Widgets.showToast(response.message, error: true);
      return [];
    }
  }

  /// hourly weather from coordinates
  Future<HourlyWeather> getHourlyWeatherByCoordinates({required double lat, required double lon}) async {

    final response = await _httpService
        .getRequest(Apiurls.forecastUrlByCoordinates(lat: lat, lon: lon), useCache: true);
        print(response.json);
    print(Apiurls.forecastUrlByCoordinates(lat: lat,lon: lon));
    if (response.isSuccess) {
      return HourlyWeather.fromJson(response.json);
    } else {
      Widgets.showToast(response.message, error: true);
      return HourlyWeather(cod: '', message: 0, cnt: 0, list: const [], city: null);
    }
  }
  /// get Weekly Forecast by coordinates
  Future<WeeklyWeather?> getWeeklyForecastByCoordinates(
      double lat, double lon) async {
    final response = await _httpService
        .getRequest(Apiurls.weeklyWeatherUrl(lat: lat, lon: lon), useCache: true);
    if (response.isSuccess) {
      return WeeklyWeather.fromJson(response.json);
    } else {
      Widgets.showToast(response.message, error: true);
      return null;
    }
  }

}
