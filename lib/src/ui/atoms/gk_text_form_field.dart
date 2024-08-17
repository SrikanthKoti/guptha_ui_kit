import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guptha_ui_kit/src/core/constants/gk_colors.dart';
import 'package:guptha_ui_kit/src/core/constants/gk_images.dart';
import 'package:guptha_ui_kit/src/core/constants/text_styles/gk_inter_styles.dart';
import 'package:guptha_ui_kit/src/ui/atoms/gk_image_icon_view.dart';

enum InputFieldType { bordered, borderless }

class GkTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final AutovalidateMode autoValidateMode;
  final bool isPassword;
  final InputFieldType type;
  final double fontSize;
  final Color textColor;
  final Color cursorColor;
  final TextInputType keyboardType;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextStyle? errorStyle;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? hintStyle;
  final TextStyle? style;

  final Radius? cursorRadius;
  final double cursorWidth;
  final int? maxLines;

  const GkTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.isPassword = false,
    this.type = InputFieldType.bordered,
    this.fontSize = 16,
    this.textColor = GkColors.black,
    this.keyboardType = TextInputType.text,
    this.cursorColor = GkColors.violet100,
    this.fontWeight = FontWeight.w500,
    this.fontFamily,
    this.errorStyle,
    this.prefixIcon,
    this.prefixIconConstraints = const BoxConstraints(maxHeight: 84),
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    this.cursorWidth = 1,
    this.style,
    this.maxLines = 1,
    this.cursorRadius,
  });

  @override
  State<GkTextFormField> createState() => _GkTextFormFieldState();
}

class _GkTextFormFieldState extends State<GkTextFormField> {
  bool _obscureText = true;

  InputDecoration _getDecoration() {
    if (widget.type == InputFieldType.borderless) {
      return InputDecoration(
        errorStyle: widget.errorStyle ?? GkInterStyles.tffError,
        border: InputBorder.none,
        prefixIconConstraints: widget.prefixIconConstraints,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            GkInterStyles.tffHint.copyWith(
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
              color: widget.textColor,
            ),
      );
    }
    return InputDecoration(
      border: widget.border ??
          OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            borderSide: const BorderSide(color: GkColors.baseLight40, width: 1),
          ),
      enabledBorder: widget.enabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            borderSide: const BorderSide(color: GkColors.baseLight40, width: 1),
          ),
      focusedBorder: widget.focusedBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            borderSide: const BorderSide(color: GkColors.violet100, width: 2),
          ),
      hintText: widget.hintText,
      hintStyle: widget.hintStyle ??
          GkInterStyles.tffHint.copyWith(
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            color: widget.textColor,
          ),
      suffixIcon: widget.isPassword
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: GkImageIconView(
                assetPath: GkImages.show,
                iconColor: _obscureText ? GkColors.baseLight20 : GkColors.violet100,
                dHeight: 12.h,
                dWidth: 21.w,
                fit: BoxFit.scaleDown,
              ),
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: _getDecoration(),
      obscureText: widget.isPassword ? _obscureText : false,
      cursorColor: widget.cursorColor,
      style: widget.style ??
          GkInterStyles.bodyTwo.copyWith(
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            color: widget.textColor,
            height: 1,
          ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      maxLines: widget.maxLines,
      cursorRadius: widget.cursorRadius ?? const Radius.circular(100),
      cursorWidth: widget.cursorWidth,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      autovalidateMode: widget.autoValidateMode,
      validator: widget.validator,
    );
  }
}
