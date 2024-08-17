// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:guptha_ui_kit/src/core/constants/gk_colors.dart';

abstract class GkInterStyles {
  double fontSizeAdjustment(double fontSize);
  GkColors getGkColorsInstance();
  String getFontFamily() {
    return 'Inter';
  }

  String fontFamily = 'Inter';
  TextStyle get tiny => TextStyle(
        fontSize: fontSizeAdjustment(12),
        fontWeight: FontWeight.w500,
        color: getGkColorsInstance().dark75,
        fontFamily: fontFamily,
      );
  TextStyle get small => TextStyle(
        fontSize: fontSizeAdjustment(13),
        fontWeight: FontWeight.w500,
        color: getGkColorsInstance().dark75,
        fontFamily: fontFamily,
      );

  TextStyle get bodyThree => TextStyle(
        fontSize: fontSizeAdjustment(14),
        fontWeight: FontWeight.w500,
        color: getGkColorsInstance().dark75,
        fontFamily: fontFamily,
      );
  TextStyle get bodyTwo => TextStyle(
        fontSize: fontSizeAdjustment(16),
        fontWeight: FontWeight.w600,
        color: getGkColorsInstance().dark75,
        fontFamily: fontFamily,
      );
  TextStyle get bodyOne => TextStyle(
        fontSize: fontSizeAdjustment(16),
        fontWeight: FontWeight.w500,
        color: getGkColorsInstance().dark75,
        fontFamily: fontFamily,
      );
  TextStyle get titleThree => TextStyle(
        fontSize: fontSizeAdjustment(18),
        fontWeight: FontWeight.w600,
        color: getGkColorsInstance().dark75,
        fontFamily: fontFamily,
      );
  TextStyle get titleTwo => TextStyle(
        fontSize: fontSizeAdjustment(24),
        fontWeight: FontWeight.w700,
        color: getGkColorsInstance().dark75,
        fontFamily: fontFamily,
      );
  TextStyle get titleOne => TextStyle(
        fontSize: fontSizeAdjustment(32),
        fontWeight: FontWeight.w700,
        color: getGkColorsInstance().dark75,
        fontFamily: fontFamily,
      );
  TextStyle get titleX => TextStyle(
        fontSize: fontSizeAdjustment(64),
        fontWeight: FontWeight.w700,
        color: getGkColorsInstance().dark75,
        fontFamily: fontFamily,
      );
  TextStyle get s34_base_dark_50 => TextStyle(
        fontSize: fontSizeAdjustment(34),
        fontWeight: FontWeight.w500,
        color: getGkColorsInstance().baseDark50,
        fontFamily: fontFamily,
      );
  TextStyle get s10_w500_violet_100 => TextStyle(
        fontSize: fontSizeAdjustment(10),
        fontWeight: FontWeight.bold,
        color: getGkColorsInstance().violet100,
        fontFamily: fontFamily,
      );
  TextStyle get s10_bold_c6c6c6 => TextStyle(
        fontSize: fontSizeAdjustment(10),
        fontWeight: FontWeight.bold,
        color: getGkColorsInstance().color_c6c6c6,
        fontFamily: fontFamily,
      );
  TextStyle get s14_w500_base_light_20 => TextStyle(
        fontSize: fontSizeAdjustment(14),
        fontWeight: FontWeight.w500,
        color: getGkColorsInstance().baseLight20,
        fontFamily: fontFamily,
      );
  TextStyle get s24_w500_light_100 => TextStyle(
        fontSize: fontSizeAdjustment(24),
        fontWeight: FontWeight.w500,
        color: getGkColorsInstance().baseLight100,
        fontFamily: fontFamily,
      );
  TextStyle get s40_w600_base_dark_75 => TextStyle(
        fontSize: fontSizeAdjustment(40),
        fontWeight: FontWeight.w600,
        color: getGkColorsInstance().baseDark75,
        fontFamily: fontFamily,
      );

  // gk_text_form_field
  TextStyle get tffError => TextStyle(
        fontSize: fontSizeAdjustment(12),
        fontWeight: FontWeight.w500,
        color: getGkColorsInstance().red100,
        fontFamily: fontFamily,
      );
  TextStyle get tffHint => TextStyle(
        fontSize: fontSizeAdjustment(16),
        fontWeight: FontWeight.w600,
        color: getGkColorsInstance().dark75,
        fontFamily: fontFamily,
      );
}
