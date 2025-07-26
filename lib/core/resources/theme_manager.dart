import 'package:flutter/material.dart';
import 'package:photo_gallery/core/resources/colors_manager.dart';

class ThemeManager{
  ThemeManager._();

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
  );

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black
  );
}