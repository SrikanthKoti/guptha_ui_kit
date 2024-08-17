// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:flutter/foundation.dart';

abstract class GkImages {
  String get baseIconPath =>
      "${(kDebugMode && kIsWeb) ? "packages/guptha_ui_kit/" : "packages/guptha_ui_kit/assets/"}icons/";
  String get baseImagePath =>
      "${(kDebugMode && kIsWeb) ? "packages/guptha_ui_kit/" : "packages/guptha_ui_kit/assets/"}images/";

  String get email => baseIconPath + 'mail.svg';

  String get arrowLeft => baseIconPath + 'arrow-left.svg';
  String get show => baseIconPath + 'show.svg';
  String get google => baseIconPath + 'google.svg';

  String get plusIcon => baseIconPath + "icon_add.svg";

  String get ALERT_TOAST_ICON => baseIconPath + 'info_alert_icon.svg';
  String get INFORMATION_TOAST_ICON => baseIconPath + 'info_information_icon.svg';
  String get ERROR_TOAST_ICON => baseIconPath + 'info_error_icon.svg';
  String get TOAST_SUCCESS_ICON => baseIconPath + 'toast_success.svg';
  String get GREEN_TICK_BIG => baseIconPath + 'greenTickBig.png';

  String get GREEN_TICK => baseIconPath + 'green_tick.svg';

  String get icon_home => baseIconPath + 'icon_home.svg';
  String get icon_transaction => baseIconPath + 'icon_transaction.svg';
  String get icon_budget => baseIconPath + 'icon_budget.svg';
  String get icon_profile => baseIconPath + 'icon_profile.svg';

  String get icon_account => baseIconPath + 'icon_account.svg';
  String get icon_settings => baseIconPath + 'icon_settings.svg';
  String get icon_exports => baseIconPath + 'icon_exports.svg';
  String get icon_logout => baseIconPath + 'icon_logout.svg';
  String get icon_edit => baseIconPath + 'icon_edit.svg';
}
