import '../config/config.dart';

/// This class contains all the api urls
class Apiurls {
  Apiurls._();

  /// Base Url
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  /// Login Url
  static const String loginUrl = '${_baseUrl}login';


  /// weather from city url
  static String weatherUrl({String? city}) =>
      '$_baseUrl/weather?q=$city&appid=${Config.weatherApiKey}&units=metric';

  /// weather from coordinates url
  static String weatherUrlFromCoordinates({double? lat, double? lon}) =>
      '$_baseUrl/weather?lat=$lat&lon=$lon&appid=${Config.weatherApiKey}&units=metric';

  /// forecast url by city
  static String forecastUrl({String? city}) => '$_baseUrl/forecast?q=$city&appid=${Config.weatherApiKey}&units=metric';
/// forecast url by coordinates
///  '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';
  static String forecastUrlByCoordinates({double? lat, double? lon}) => '$_baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Config.weatherApiKey}';
/// weekly weather by coordinates
static String weeklyWeatherUrl({double? lat, double? lon}) =>
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto&latitude=$lat&longitude=$lon';
}
