import 'package:flutter/material.dart';
import 'package:notify/theme/main_theme.dart';
import 'package:notify/theme/temp_color.dart';

ThemeData lightTheme1(BuildContext context) {
  return mainTheme(context, Tempcolor.generateRandomLightColor(), false);
}
