import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/core/resources/colors_manager.dart';

class ThemeManager{
  ThemeManager._();

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 24.sp,
        color: ColorsManager.blue
      )
    )
  );

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 24.sp,
              color: ColorsManager.white
          )
      )
  );
}