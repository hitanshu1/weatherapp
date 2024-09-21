
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Widgets/Widgets.dart';
import '../../../core/utils/getStorage.dart';
import '../../../core/utils/locationService.dart';
import '../../../domain/repositories/weather/repo.dart';
import 'event.dart';
import 'state.dart';

/// weather bloc
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  /// weather repository
  final WeatherRepository repository;

  /// constructor
  WeatherBloc(this.repository) : super(const WeatherState()) {
    on<FetchCurrentLocationWeather>(_fetchCurrentLocationWeather);

    on<FetchHourlyWeather>(_fetchHourlyWeather);

    on<FetchWeeklyWeather>(_fetchWeeklyWeather);
    on<FetchWeatherByName>(_fetchWeatherByName);
    on<OnChangeSearchText>(_onChangeSearchText);
    on<ChangeSettingTempUnit>(_changeSettingTempUnit);
  }

  /// fetch weather
  ///
  Future<void> _fetchCurrentLocationWeather(
    FetchCurrentLocationWeather event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final location = await LocationService.getCurrentLocation();
      final result = await repository.getWeatherFromCoordinates(
        location.latitude,
        location.longitude,
      );
      emit(state.copyWith(isLoading: false, weather: result, searchName: ''));
    } catch (e) {
      Widgets.showToast(e.toString(), error: true);
      emit(state.copyWith(isLoading: false));
    }
    add(FetchHourlyWeather());
    add(FetchWeeklyWeather());
  }

  /// fetch hourly weather
  ///
  Future<void> _fetchHourlyWeather(
    FetchHourlyWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final location = await LocationService.getCurrentLocation();
    final result = await repository.getHourlyWeatherByCoordinates(
      lat: state.weather?.coord.lat ?? location.latitude,
      lon: state.weather?.coord.lon ?? location.longitude,
    );
    emit(state.copyWith(isLoading: false, hourlyWeather: result));
  }

  /// fetch weekly weather
  ///
  Future<void> _fetchWeeklyWeather(
    FetchWeeklyWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final location = await LocationService.getCurrentLocation();
    final result = await repository.getWeeklyForecastByCoordinates(
      state.weather?.coord.lat ?? location.latitude,
      state.weather?.coord.lon ?? location.longitude,
    );
    emit(state.copyWith(isLoading: false, weeklyWeather: result));
  }

  /// on change search text
  ///
  Future<void> _onChangeSearchText(
    OnChangeSearchText event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(searchName: event.text));
  }

  /// fetch weather by name
  ///
  Future<void> _fetchWeatherByName(
    FetchWeatherByName event,
    Emitter<WeatherState> emit,
  ) async {
    if (state.searchName == null) {
      Widgets.showToast('Enter city name', error: true);
      return;
    }
    emit(state.copyWith(isLoading: true));
    final result = await repository.getWeather(state.searchName ?? '');

    emit(state.copyWith(isLoading: false, weather: result));

    if (result != null) {
      add(FetchHourlyWeather());
      add(FetchWeeklyWeather());
    }
  }

  /// change setting temp unit
  ///
  Future<void> _changeSettingTempUnit(
    ChangeSettingTempUnit event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(isLoading:true));
    AppGetXStorage.saveTempUnit(event.isCelsius);
    emit(state.copyWith(isLoading: false,));
  }
}
