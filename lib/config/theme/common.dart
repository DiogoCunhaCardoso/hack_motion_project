// this file is for styles that are common throughout the entire app
// in this case the appBar is always styled the same so I can style it globally.

import 'package:flutter/material.dart';

class CustomWidgetStyles {
  static AppBarTheme getAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: colorScheme.surface,
      elevation: 0,
    );
  }
}
