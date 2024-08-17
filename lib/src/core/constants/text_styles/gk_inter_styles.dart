// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guptha_ui_kit/src/core/constants/gk_colors.dart';

class GkInterStyles {
  static const String _fontFamily = 'Inter';
  static TextStyle get tiny => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: GkColors.dark75,
        fontFamily: _fontFamily,
      );
  static TextStyle get small => TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: GkColors.dark75,
        fontFamily: _fontFamily,
      );

  static TextStyle get bodyThree => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: GkColors.dark75,
        fontFamily: _fontFamily,
      );
  static TextStyle get bodyTwo => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: GkColors.dark75,
        fontFamily: _fontFamily,
      );
  static TextStyle get bodyOne => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: GkColors.dark75,
        fontFamily: _fontFamily,
      );
  static TextStyle get titleThree => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: GkColors.dark75,
        fontFamily: _fontFamily,
      );
  static TextStyle get titleTwo => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: GkColors.dark75,
        fontFamily: _fontFamily,
      );
  static TextStyle get titleOne => TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: GkColors.dark75,
        fontFamily: _fontFamily,
      );
  static TextStyle get titleX => TextStyle(
        fontSize: 64.sp,
        fontWeight: FontWeight.w700,
        color: GkColors.dark75,
        fontFamily: _fontFamily,
      );
  static TextStyle get s34_base_dark_50 => TextStyle(
        fontSize: 34.sp,
        fontWeight: FontWeight.w500,
        color: GkColors.baseDark50,
        fontFamily: _fontFamily,
      );
  static TextStyle get s10_w500_violet_100 => TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        color: GkColors.violet100,
        fontFamily: _fontFamily,
      );
  static TextStyle get s10_bold_c6c6c6 => TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        color: GkColors.color_c6c6c6,
        fontFamily: _fontFamily,
      );
  static TextStyle get s14_w500_base_light_20 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: GkColors.baseLight20,
        fontFamily: _fontFamily,
      );
  static TextStyle get s24_w500_light_100 => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: GkColors.baseLight100,
        fontFamily: _fontFamily,
      );
  static TextStyle get s40_w600_base_dark_75 => TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.w600,
        color: GkColors.baseDark75,
        fontFamily: _fontFamily,
      );

  // gk_text_form_field
  static TextStyle get tffError => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: GkColors.red100,
        fontFamily: _fontFamily,
      );
  static TextStyle get tffHint => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: GkColors.dark75,
        fontFamily: _fontFamily,
      );
}
