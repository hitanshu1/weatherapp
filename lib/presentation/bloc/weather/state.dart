import 'package:equatable/equatable.dart';

import '../../../data/models/weather/hourlyWeather.dart';
import '../../../data/models/weather/weather.dart';
import '../../../data/models/weather/weeklyWeather.dart';

/// weather state
class WeatherState extends Equatable {
  /// weather data
  final WeatherModel? weather;
  /// HourlyWeather
  final HourlyWeather? hourlyWeather;
  /// weakly weather report
  final WeeklyWeather? weeklyWeather;
  /// name
  final String? searchName;

  /// is loading
  final bool isLoading;

  /// constructor
  const WeatherState(
      {this.weather, this.isLoading = false, this.hourlyWeather, this.weeklyWeather, this.searchName});
  @override
  List<Object?> get props => [weather, isLoading, hourlyWeather, weeklyWeather, searchName];

  /// copy with
  WeatherState copyWith({
    WeatherModel? weather,
    bool? isLoading,
    HourlyWeather? hourlyWeather,
    WeeklyWeather? weeklyWeather,
    String? searchName,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      isLoading: isLoading ?? this.isLoading,
      hourlyWeather: hourlyWeather ?? this.hourlyWeather,
      weeklyWeather: weeklyWeather ?? this.weeklyWeather,
      searchName: searchName ?? this.searchName,
    );
  }
}

/// while fetch weather error
class WeatherError extends WeatherState {
  /// error message
  final String message;

  /// constructor
  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}
