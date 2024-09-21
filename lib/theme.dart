import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/constants.dart';

/// Returns a `ThemeData` object based on the provided `isDark` parameter.
///
/// Parameters:
/// - `isDark`: A boolean value that determines the brightness of the theme.
///
/// Returns:
/// - A `ThemeData` object with the specified brightness, primary color, and various other theme properties.
ThemeData theme(bool isDark) {
  const Color primary = Colorz.primary;
  const Color foregroundColor = Colorz.secondaryBlack;
  final WidgetStateProperty<Color?> _property =
      WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return null;
    }
    if (states.contains(WidgetState.selected)) {
      return primary;
    }
    return null;
  });
  final ThemeData data =
      isDark ? ThemeData.dark(useMaterial3: false) : ThemeData.light(useMaterial3: false);
  return data.copyWith(
    scaffoldBackgroundColor: Colorz.darkBlue,
      brightness: Brightness.light,
      primaryColor: Colorz.primary,
      appBarTheme:  AppBarTheme(foregroundColor: foregroundColor, color: Colors.white,centerTitle: false,
      titleTextStyle: TextStyle(fontSize: 23.sp,fontWeight: FontWeight.bold,color: Colorz.primary),),
      switchTheme: SwitchThemeData(thumbColor: _property, trackColor: _property),
      radioTheme: RadioThemeData(fillColor: _property),
      checkboxTheme: CheckboxThemeData(fillColor: _property),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: foregroundColor, backgroundColor: primary),
          navigationBarTheme: const NavigationBarThemeData(
             backgroundColor: Colorz.secondaryBlack,
          ),
      
          
        );
}
