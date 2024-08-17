import 'package:flutter/material.dart';
import 'package:guptha_ui_kit/src/core_imp/constants/gk_colors_imp.dart';
import 'package:guptha_ui_kit/src/core_imp/constants/gk_images_imp.dart';
import 'package:guptha_ui_kit/src/core_imp/constants/text_styles/gk_inter_styles_imp.dart';
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
  final Color? textColor;
  final Color? cursorColor;
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
  final double? width;
  final Radius? cursorRadius;
  final double cursorWidth;
  final int? maxLines;
  final double borderRadius;

  const GkTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.isPassword = false,
    this.type = InputFieldType.bordered,
    this.fontSize = 16,
    this.textColor,
    this.keyboardType = TextInputType.text,
    this.cursorColor,
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
    this.borderRadius = 16,
    this.width,
  });

  @override
  State<GkTextFormField> createState() => _GkTextFormFieldState();
}

class _GkTextFormFieldState extends State<GkTextFormField> {
  bool _obscureText = true;
  final GkColorsImp _gkColors = GkColorsImp();
  final GkInterStylesImp _gkInterStyles = GkInterStylesImp();
  final GkImagesImp _gkImages = GkImagesImp();

  InputDecoration _getDecoration() {
    if (widget.type == InputFieldType.borderless) {
      return InputDecoration(
        errorStyle: widget.errorStyle ?? _gkInterStyles.tffError,
        border: InputBorder.none,
        prefixIconConstraints: widget.prefixIconConstraints,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            _gkInterStyles.tffHint.copyWith(
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
              color: widget.textColor ?? _gkColors.black,
            ),
      );
    }
    return InputDecoration(
      border: widget.border ??
          OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(color: _gkColors.baseLight40, width: 1),
          ),
      enabledBorder: widget.enabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(color: _gkColors.baseLight40, width: 1),
          ),
      focusedBorder: widget.focusedBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(color: _gkColors.violet100, width: 2),
          ),
      hintText: widget.hintText,
      hintStyle: widget.hintStyle ??
          _gkInterStyles.tffHint.copyWith(
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            color: widget.textColor ?? _gkColors.black,
          ),
      suffixIcon: widget.isPassword
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: GkImageIconView(
                assetPath: _gkImages.show,
                iconColor: _obscureText ? _gkColors.baseLight20 : _gkColors.violet100,
                dHeight: 12,
                dWidth: 21,
                fit: BoxFit.scaleDown,
              ),
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        decoration: _getDecoration(),
        obscureText: widget.isPassword ? _obscureText : false,
        cursorColor: widget.cursorColor ?? _gkColors.violet100,
        style: widget.style ??
            _gkInterStyles.bodyTwo.copyWith(
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
              color: widget.textColor ?? _gkColors.black,
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
      ),
    );
  }
}
