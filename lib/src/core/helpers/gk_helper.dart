import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:guptha_ui_kit/src/ui/atoms/gk_toast_widget.dart';
import 'package:guptha_ui_kit/src/ui/overlay_manager.dart';

abstract class GkHelper {
  String _strAppVersion = '';

  void printJson(String input) {
    if (kDebugMode) {
      var decoded = const JsonDecoder().convert(input);
      var prettyJson = const JsonEncoder.withIndent(' ').convert(decoded);
      log(prettyJson);
    }
  }

  EdgeInsets getStatusBarSize(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  Brightness getCurrentAppTheme(context) {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness;
  }

  getAppTextTheme(context) {
    return Theme.of(context).textTheme;
  }

  void dismissKeypad(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  printLogs(dynamic strData) {
    if (kDebugMode) {
      print(strData);
    }
  }

  setAppVersion(String strAppVersion) {
    _strAppVersion = strAppVersion;
  }

  getAppVersion() {
    return _strAppVersion;
  }

  bool isSvg(String assetPath) {
    if (assetPath.isNotEmpty && assetPath.toLowerCase().contains(".svg")) {
      return true;
    }
    return false;
  }

  bool areDatesEqual(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) {
      return false;
    } else {
      return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
    }
  }

  ColorFilter getSVGColor(Color color) {
    return ColorFilter.mode(color, BlendMode.srcIn);
  }

  showLoader({double opacity = 0.25, Color color = Colors.white, Widget? loaderWidget}) async {
    GkOverlayManager.showLoader(opacity: opacity, color: color, loaderWidget: loaderWidget);
    //20 ms delay for postFrameCallback scheduling
    await Future.delayed(const Duration(milliseconds: 50));
    // }
  }

  hideLoader() async {
    await Future.delayed(const Duration(milliseconds: 50));
    GkOverlayManager.hideOverlay();
  }

  showToast(
      {required String msg,
      ToastType type = ToastType.error,
      ToastDuration duration = ToastDuration.medium,
      Widget? toastWidget}) {
    GkOverlayManager.showToast(type: type, msg: msg, duration: duration, toastWidget: toastWidget);
  }
}
