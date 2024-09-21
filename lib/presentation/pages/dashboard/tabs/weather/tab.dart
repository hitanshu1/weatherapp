import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

import '../../../../../Widgets/Widgets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../bloc/weather/bloc.dart';
import '../../../../bloc/weather/event.dart';
import '../../../../bloc/weather/state.dart';
import '../../../../common/hourlyforecast.dart';
import '../../../../common/info.dart';

/// Weather Tab
class WeatherTab extends StatelessWidget {
  ///constructor
  const WeatherTab({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(FetchCurrentLocationWeather());
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state.weather == null) {
          return Widgets.loader();
        }
        return  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TxtField.search(
                              text: state.searchName,
                              key: Key('${state.weather?.name}'),
                              
                              onChanged: (val){
                              context.read<WeatherBloc>().add(OnChangeSearchText(val));
                            },
                            onPressed: (){
                              
                              context.read<WeatherBloc>().add(FetchWeatherByName());
                            },
                            hintText: AppStrings.searchCity,),
                          ),
                          IconButton(onPressed: (){
                            context.read<WeatherBloc>().add(FetchCurrentLocationWeather());
                          }, icon: const Icon(Icons.gps_fixed,color: Colorz.white,))
                        ],
                      ),
                      SizeConfig.verticalSpace(),
                      // Country name text
                      Text(
                        state.weather?.name ?? '',
                        style: AppTextstyle.bigHeader,
                      ),

                      const SizedBox(height: 20),

                      // Today's date
                      Text(
                        Widgets.toDateTime(state.weather?.dt ??
                            DateTime.now().millisecondsSinceEpoch),
                        style: AppTextstyle.subtitleText,
                      ),

                      const SizedBox(height: 30),
                      Expanded(child: ListView(
                        children: [
                           SizedBox(
                        height: 160.sp,
                        child: Image.asset(
                          'assets/icons/${state.weather!.weather[0].icon.replaceAll('n', 'd')}.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Weather description
                      Text(
                        state.weather!.weather[0].description.capitalize ?? '',
                        style: AppTextstyle.mediumHeader,
                      ),
                       const SizedBox(height: 40),

                  // Weather info in a row

                  WeatherInfoWidget(
                    key: UniqueKey(),
                    weather: state.weather!),

                  const SizedBox(height: 40),

                 
                  Txt.title('Today Daily Forecast'),

                  const SizedBox(height: 15),

                  // hourly forcast
                  const HourlyforecastHorizontalList(),
                        ],
                      ))
                     
                    ],
                  )

               ;
      },
    );
  }
}
