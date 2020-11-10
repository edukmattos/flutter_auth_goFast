import 'package:flutter/material.dart';

import '../../interfaces/app_theme_interface.dart';

class AppThemeDark implements IAppThemeInterface {
  @override
  ThemeData getThemeData() {
    return ThemeData.dark();
  }

  @override
  String themeToString() {
    return ThemeMode.dark.toString();
  }
}
