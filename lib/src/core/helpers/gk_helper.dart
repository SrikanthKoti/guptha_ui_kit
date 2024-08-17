import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class GkHelper {
  static String _strAppVersion = '';

  static void printJson(String input) {
    if (kDebugMode) {
      var decoded = const JsonDecoder().convert(input);
      var prettyJson = const JsonEncoder.withIndent(' ').convert(decoded);
      log(prettyJson);
    }
  }

  static EdgeInsets getStatusBarSize(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Brightness getCurrentAppTheme(context) {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness;
  }

  static getAppTextTheme(context) {
    return Theme.of(context).textTheme;
  }

  static void dismissKeypad(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static printLogs(dynamic strData) {
    if (kDebugMode) {
      print(strData);
    }
  }

  static setAppVersion(String strAppVersion) {
    _strAppVersion = strAppVersion;
  }

  static getAppVersion() {
    return _strAppVersion;
  }

  static bool isSvg(String assetPath) {
    if (assetPath.isNotEmpty && assetPath.toLowerCase().contains(".svg")) {
      return true;
    }
    return false;
  }

  static bool areDatesEqual(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) {
      return false;
    } else {
      return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
    }
  }

  static ColorFilter getSVGColor(Color color) {
    return ColorFilter.mode(color, BlendMode.srcIn);
  }
}
