import 'package:flutter/material.dart';

import '../../../../../Widgets/Widgets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../common/hourlyforecast.dart';
import 'weaklyforecast/list.dart';

/// Dashboard Forecast Tab
class DashboardForecastTab extends StatelessWidget {
  /// constructor
  const DashboardForecastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Txt.title(AppStrings.forecastReport),
        SizeConfig.verticalSpace(),
        _dateInfo(),
        SizeConfig.verticalSpace(),
        const HourlyforecastHorizontalList(),
        SizeConfig.verticalSpace(),
        const Expanded(child:  WeaklyForecastList())
      ],
    );
  }

  Widget _dateInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Txt(
          'Today',
          textStyle: AppTextstyle.mediumHeader,
        ),
        Txt(
          Widgets.toDate(DateTime.now().millisecondsSinceEpoch),
          textStyle: AppTextstyle.subtitleText,
        ),
      ],
    );
  }
}
