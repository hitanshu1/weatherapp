import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Widgets/Widgets.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../bloc/weather/bloc.dart';
import '../../../../../bloc/weather/event.dart';
import '../../../../../bloc/weather/state.dart';

/// Search Text Field
class SearTextFiled extends StatelessWidget {
  /// constructor
  const SearTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: TxtField.search(
                text: state.searchName,
                key: Key('${state.weather?.name}'),
                onChanged: (val) {
                  context.read<WeatherBloc>().add(OnChangeSearchText(val));
                },
                onPressed: () {
                  context.read<WeatherBloc>().add(FetchWeatherByName());
                },
                hintText: AppStrings.searchCity,
              ),
            ),
            IconButton(
                onPressed: () {
                  context
                      .read<WeatherBloc>()
                      .add(FetchCurrentLocationWeather());
                },
                icon: const Icon(
                  Icons.gps_fixed,
                  color: Colorz.white,
                ))
          ],
        );
      },
    );
  }
}
