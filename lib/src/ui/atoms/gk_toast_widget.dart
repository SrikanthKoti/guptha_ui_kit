import 'package:flutter/material.dart';
import 'package:guptha_ui_kit/guptha_ui_kit.dart';
import 'package:guptha_ui_kit/src/core_imp/constants/gk_colors_imp.dart';
import 'package:guptha_ui_kit/src/ui/ui_imports.dart';

class ToastThemeColor {
  final Color backGroundColor;
  final Color color;
  ToastThemeColor({required this.backGroundColor, required this.color});
}

enum ToastType { information, alert, error, success }

enum ToastDuration { short, medium, long }

class GkToastWidget extends StatelessWidget {
  final String title;
  final ToastType type;

  const GkToastWidget({
    super.key,
    this.title = "SUCCESS",
    required this.type,
  });

  ToastThemeColor _getToastTheme(ToastType type) {
    switch (type) {
      case ToastType.success:
        return ToastThemeColor(
            backGroundColor: GkColorsImp().TOAST_SUCCESS_BACKGROUND, color: gkColors.TOAST_SUCCESS);
      case ToastType.error:
        return ToastThemeColor(
            backGroundColor: gkColors.TOAST_ERROR_BACKGROUND, color: gkColors.TOAST_ERROR);
      case ToastType.alert:
        return ToastThemeColor(
            backGroundColor: gkColors.TOAST_ALERT_BACKGROUND, color: gkColors.TOAST_ALERT);
      case ToastType.information:
        return ToastThemeColor(
            backGroundColor: gkColors.TOAST_INFORMATION_BACKGROUND,
            color: gkColors.TOAST_INFORMATION);
      default:
        return ToastThemeColor(
            backGroundColor: gkColors.TOAST_INFORMATION_BACKGROUND,
            color: gkColors.TOAST_INFORMATION);
    }
  }

  _getToastIcon(ToastType type) {
    switch (type) {
      case ToastType.success:
        return gkImages.TOAST_SUCCESS_ICON;
      case ToastType.error:
        return gkImages.ERROR_TOAST_ICON;
      case ToastType.information:
        return gkImages.INFORMATION_TOAST_ICON;
      case ToastType.alert:
        return gkImages.ALERT_TOAST_ICON;
      default:
        return gkImages.GREEN_TICK_BIG;
    }
  }

  Widget _toastTitle(BuildContext context) {
    return Row(
      children: [
        AbsorbPointer(
          child: GkImageIconView(
            assetPath: _getToastIcon(type),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.68,
          child: Text(
            title,
            style: gkInterStyles.titleThree.copyWith(color: _getToastTheme(type).color),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: _getToastTheme(type).backGroundColor),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  _toastTitle(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
