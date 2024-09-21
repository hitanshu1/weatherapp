
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../data/models/weather/weather.dart';
import '../../core/utils/appCoverter.dart';
import 'tiles/weatherInfo.dart';


/// Weather Info widget
class WeatherInfoWidget extends StatelessWidget {
  /// weather to show
  final WeatherModel weather;
  /// Weather Info Card
  const WeatherInfoWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 30.sp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherInfoTile(
           
            title: 'Temp',
            value: AppConverter.getTemValue(weather.main.temp),
          ),
            WeatherInfoTile(
            title: 'Wind',
            value: '${weather.wind.speed} km/h',
          ),
          WeatherInfoTile(
            title: 'Humidity',
            value: '${weather.main.humidity}%',
          ),
        ],
      ),
    );
  }
}
