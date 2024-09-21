import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/Widgets.dart';
/// Subscript Text
class SuperscriptText extends StatelessWidget {
  /// constructor
  const SuperscriptText({
    super.key,
    required this.text,
    required this.superScript,
    required this.color,
    required this.superscriptColor,
  });
///text
  final String text;
  /// superscript
  final String superScript;
  /// color
  final Color color;
  /// superscript color
  final Color superscriptColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Txt(
          text,
          color: color,
            fontSize: 40.sp,
            fontWeight: FontWeight.w400,
        ),
        Txt(
          superScript,
           color: superscriptColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
