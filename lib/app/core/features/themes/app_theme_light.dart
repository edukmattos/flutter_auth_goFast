import 'package:flutter/material.dart';

import '../../interfaces/app_theme_interface.dart';

class AppThemeLight implements IAppThemeInterface {
  @override
  ThemeData getThemeData() {
    return ThemeData.light();
  }

  @override
  String themeToString() {
    return ThemeMode.light.toString();
  }
}
