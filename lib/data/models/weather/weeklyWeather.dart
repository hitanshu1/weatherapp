// ignore_for_file: public_member_api_docs

import '../../../core/constants/constants.dart';
import '../Model.dart';

/// current model
class Current extends Model{
  final String time;
  final int interval;
///constructor
  Current({
    required this.time,
    required this.interval,
  });
/// from json
  factory Current.fromJson(Map<String, dynamic> json) => Current(
        time: json['time'],
        interval: json['interval'],
      );

  @override
  Json get toJson => {
        'time': time,
        'interval': interval,
      };

  @override
  ///copy with
  Current copyWith({
    String? time,
    int? interval,
  }) =>
      Current(
        time: time ?? this.time,
        interval: interval ?? this.interval,
      );
  
}

class Daily extends Model {
  final List<dynamic> time;
  final List<dynamic> weatherCode;
  final List<dynamic> temperature2mMax;
  final List<dynamic> temperature2mMin;

  Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: json['time'],
        weatherCode: json['weather_code'],
        temperature2mMax: json['temperature_2m_max'],
        temperature2mMin: json['temperature_2m_min'],
      );

  @override
  Json get toJson => {
        'time': time,
        'weather_code': weatherCode,
        'temperature_2m_max': temperature2mMax,
        'temperature_2m_min': temperature2mMin,
      };

  @override
  Daily copyWith({
    List<dynamic>? time,
    List<dynamic>? weatherCode,
    List<dynamic>? temperature2mMax,
    List<dynamic>? temperature2mMin,
  }) =>
      Daily(
        time: time ?? this.time,
        weatherCode: weatherCode ?? this.weatherCode,
        temperature2mMax: temperature2mMax ?? this.temperature2mMax,
        temperature2mMin: temperature2mMin ?? this.temperature2mMin,
      );
}

class WeeklyWeather extends Model {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final dynamic currentUnits;
  final dynamic current;
  final dynamic dailyUnits;
  final Daily daily;

  WeeklyWeather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeeklyWeather.fromJson(Map<String, dynamic> json) => WeeklyWeather(
        latitude: json['latitude'] ?? 0.0,
        longitude: json['longitude'] ?? 0.0,
        generationtimeMs: json['generationtime_ms'] ?? 0.0,
        utcOffsetSeconds: json['utc_offset_seconds'] ?? 0,
        timezone: json['timezone'] ?? '',
        timezoneAbbreviation: json['timezone_abbreviation'] ?? '',
        elevation: json['elevation'] ?? 0.0,
        currentUnits: CurrentUnits.fromJson(json['current_units']),
        current: Current.fromJson(json['current']),
        dailyUnits: DailyUnits.fromJson(json['daily_units']),
        daily: Daily.fromJson(json['daily']),
      );

  @override
  Json get toJson => {
        'latitude': latitude,
        'longitude': longitude,
        'generationtime_ms': generationtimeMs,
        'utc_offset_seconds': utcOffsetSeconds,
        'timezone': timezone,
        'timezone_abbreviation': timezoneAbbreviation,
        'elevation': elevation,
        'current_units': currentUnits,
        'current': current,
        'daily_units': dailyUnits,
        'daily': daily,
      };

  @override
  WeeklyWeather copyWith({
    double? latitude,
    double? longitude,
    double? generationtimeMs,
    int? utcOffsetSeconds,
    String? timezone,
    String? timezoneAbbreviation,
    double? elevation,
    CurrentUnits? currentUnits,
    Current? current,
    DailyUnits? dailyUnits,
    Daily? daily,
  }) =>
      WeeklyWeather(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude, 
        generationtimeMs: generationtimeMs ?? this.generationtimeMs,
        utcOffsetSeconds: utcOffsetSeconds??this.utcOffsetSeconds,
        timezone: timezone ?? this.timezone,
        timezoneAbbreviation: timezoneAbbreviation??this.timezoneAbbreviation,
        elevation: elevation??this.elevation,
        currentUnits: currentUnits??this.currentUnits,
        current: current??this.current,
        dailyUnits: dailyUnits??this.dailyUnits,
        daily: daily??this.daily,
      );
}

class CurrentUnits extends Model {
  final String time;
  final String interval;

  CurrentUnits({required this.time, required this.interval});

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        time: json['time'],
        interval: json['interval'],
      );

  @override
  Json get toJson => {
        'time': time,
        'interval': interval,
      };

  @override
  CurrentUnits copyWith({
    String? time,
    String? interval,
  }) =>
      CurrentUnits(
        time: time ?? this.time,
        interval: interval ?? this.interval,
      );
}

class DailyUnits extends Model {
  final String time;
  final String weatherCode;
  final String temperature2mMax;
  final String temperature2mMin;

  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json['time'],
        weatherCode: json['weather_code'],
        temperature2mMax: json['temperature_2m_max'],
        temperature2mMin: json['temperature_2m_min'],
      );

  @override
  Json get toJson => {
        'time': time,
        'weather_code': weatherCode,
        'temperature_2m_max': temperature2mMax,
        'temperature_2m_min': temperature2mMin,
      };

  @override
  DailyUnits copyWith({
    String? time,
    String? weatherCode,
    String? temperature2mMax,
    String? temperature2mMin,
  }) =>
      DailyUnits(
        time: time ?? this.time,
        weatherCode: weatherCode ?? this.weatherCode,
        temperature2mMax: temperature2mMax ?? this.temperature2mMax,
        temperature2mMin: temperature2mMin ?? this.temperature2mMin,
      );  
}
