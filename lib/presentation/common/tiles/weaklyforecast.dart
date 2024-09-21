import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/Widgets.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/appCoverter.dart';
import '../subscript_text.dart';
/// weekly forecast tile
class WeeklyForecastTile extends StatelessWidget {
  /// constructor
  const WeeklyForecastTile({
    super.key,
    required this.day,
    required this.date,
    required this.temp,
    required this.icon,
  });
///day
  final String day;
  ///date
  final String date;
  /// temperature
  final int temp;
  /// weather icon
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(
        horizontal: 16.sp,
        vertical: 20.sp,
      ),
      margin:  EdgeInsets.symmetric(
        vertical: 12.sp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Colorz.accentBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Txt(
                day,
                textStyle: AppTextstyle.smallHeader,
              ),
              SizeConfig.verticalSpace(),
              Txt(
                date,
                textStyle: AppTextstyle.subtitleText,
              ),
            ],
          ),

          // Temperature
          SuperscriptText(
            text: AppConverter.getTemValue(temp.toDouble(),enableUnit: false),
            color: Colorz.white,
            superScript: AppConverter.getTempUnit(),
            superscriptColor: Colorz.white,
          ),

          // weather icon
          Image.asset(
            icon,
            width: 60.sp,
          ),
        ],
      ),
    );
  }
}
