import 'package:equatable/equatable.dart';

/// weather event
abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// fetch weather
class FetchCurrentLocationWeather extends WeatherEvent {
  
/// constructor
  FetchCurrentLocationWeather();

  @override
  List<Object> get props => [];
}
/// onchange search text
class OnChangeSearchText extends WeatherEvent {

  /// constructor
  OnChangeSearchText(this.text);
/// text
  final String text;

  @override
  List<Object> get props => [text];
}
/// fetch weather by name 
class FetchWeatherByName extends WeatherEvent {
  
  /// constructor
  FetchWeatherByName();

  @override
  List<Object> get props => [];
}

/// fetch hourly weather forcast
class FetchHourlyWeather extends WeatherEvent {
  /// constructor
  FetchHourlyWeather();

  @override
  List<Object> get props => [];
}
/// fetch weekly weather forcast
class FetchWeeklyWeather extends WeatherEvent {
  /// constructor
  FetchWeeklyWeather();

  @override
  List<Object> get props => [];
}
/// change setting temp unit
class ChangeSettingTempUnit extends WeatherEvent {
  /// constructor
  ChangeSettingTempUnit(this.isCelsius);
/// celsius or fahrenheit
  final bool isCelsius;

  @override
  List<Object> get props => [isCelsius];
}
