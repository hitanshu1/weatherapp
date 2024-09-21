import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Extensions/Extensions.dart';
import '../bloc/weather/bloc.dart';
import '../bloc/weather/state.dart';
import 'tiles/hourlyforecast.dart';

/// Hourly forecast
class HourlyforecastHorizontalList extends StatelessWidget {
  /// constructor
  const HourlyforecastHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<WeatherBloc>().add(FetchHourlyWeather());
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: (state.hourlyWeather?.list.length??0)>12?12:
                state.hourlyWeather?.list.length??0,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final forecast = state.hourlyWeather!.list[index];
              return HourlyForcastTile(
                id: forecast.weather[0].id,
                hour: forecast.dt.time,
                temp: forecast.main.temp.round(),
                isActive: index == 0,
              );
            },
          ),
        );
      },
    );
  }
}
