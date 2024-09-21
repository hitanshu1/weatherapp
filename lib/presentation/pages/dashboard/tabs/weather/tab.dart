import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../bloc/weather/bloc.dart';
import '../../../../bloc/weather/event.dart';
import '../../../../bloc/weather/state.dart';
import 'widgets/searchTextfield.dart';
import 'widgets/weatherDetails.dart';

/// Weather Tab
class WeatherTab extends StatelessWidget {
  ///constructor
  const WeatherTab({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(FetchCurrentLocationWeather());
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
       
        return Column(
          children: [
            const SearTextFiled(),
            SizeConfig.verticalSpace(),
            const WeatherDetails()
          ],
        );
      },
    );
  }
}
