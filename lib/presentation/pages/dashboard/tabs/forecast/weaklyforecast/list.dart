import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Extensions/datetime.dart';
import '../../../../../../Widgets/Views/Views.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../bloc/weather/bloc.dart';
import '../../../../../bloc/weather/state.dart';
import '../../../../../common/tiles/weaklyforecast.dart';

///weekly forecast list
class WeaklyForecastList extends StatelessWidget {
  /// constructor
  const WeaklyForecastList({super.key});
  @override

  Widget build(BuildContext context) {
    // context.read<WeatherBloc>().add(FetchWeeklyWeather());
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return ListViewBuilder(
          itemCount: state.weeklyWeather?.daily.weatherCode.length??0,
          shrinkWrap: true,
          item: (index) {
            final dayOfWeek =
                DateTime.parse(state.weeklyWeather!.daily.time[index]).dayOfWeek;
            final date = state.weeklyWeather!.daily.time[index];
            final temp = state.weeklyWeather!.daily.temperature2mMax[index];
            final icon = state.weeklyWeather!.daily.weatherCode[index];

            return WeeklyForecastTile(
              date: date,
              day: dayOfWeek,
              icon: Assets.getWeatherIcon2(icon),
              temp: temp.round(),
            );
          },
        );
      },
    );
  }
}
