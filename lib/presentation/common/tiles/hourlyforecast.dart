
// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/Widgets.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/appCoverter.dart';

/// HourlyForcastTile
class HourlyForcastTile extends StatelessWidget {
  /// constructor
  const HourlyForcastTile({
    super.key,
    required this.id,
    required this.hour,
    required this.temp,
    required this.isActive,
  });

  final int id;
  final String hour;
  final int temp;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        top: 12,
        bottom: 12,
      ),
      child: Material(
        color: isActive ? Colorz.lightBlue : Colorz.accentBlue,
        borderRadius: BorderRadius.circular(15.0),
        elevation: isActive ? 8 : 0,
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 16.sp,
            vertical: 10.sp,
          ),
          child: Row(
            
            children: [
              ViewAppImage.icon(
               assetUrl:  Assets.getWeatherIcon(weatherCode: id),
               
              ),
              
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Txt(
                    hour,
                   color: Colorz.white,
                  ),
                 SizeConfig.verticalSpace(height: 5.sp),
                  Txt(
                    AppConverter.getTemValue(temp.toDouble()),
                    textStyle: AppTextstyle.smallHeader,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
