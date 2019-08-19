import 'dart:ui';

import 'package:flutter/material.dart';

class CommonUtils {
  static getThemeData(Color color) {
    return ThemeData(primarySwatch: color, platform: TargetPlatform.android);
  }
}
