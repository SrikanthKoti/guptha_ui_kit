import 'package:flutter/material.dart';
import 'package:guptha_ui_kit/src/core_imp/constants/gk_spacers_imp.dart';
import 'package:guptha_ui_kit/src/core_imp/constants/text_styles/gk_inter_styles_imp.dart';
import 'package:guptha_ui_kit/src/ui/atoms/gk_image_icon_view.dart';
import 'package:guptha_ui_kit/src/ui/ui_imports.dart';

enum InputFieldType { bordered, borderless, custom }

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
  final double? height;
  final Radius? cursorRadius;
  final double cursorWidth;
  final int? maxLines;
  final double borderRadius;
  final String label;
  final TextStyle? labelStyle;
  final InputDecoration? decoration;
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
    this.label = '',
    this.labelStyle,
    this.decoration,
    this.height,
  });

  @override
  State<GkTextFormField> createState() => _GkTextFormFieldState();
}

class _GkTextFormFieldState extends State<GkTextFormField> {
  bool _obscureText = true;

  InputDecoration _getDecoration() {
    if (widget.type == InputFieldType.custom) {
      return widget.decoration ?? const InputDecoration();
    }
    if (widget.type == InputFieldType.borderless) {
      return InputDecoration(
        errorStyle: widget.errorStyle ?? gkInterStyles.tffError,
        border: InputBorder.none,
        prefixIconConstraints: widget.prefixIconConstraints,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            gkInterStyles.tffHint.copyWith(
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
              color: widget.textColor ?? gkColors.black,
            ),
      );
    }
    return InputDecoration(
      border: widget.border ??
          OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(color: gkColors.baseLight40, width: 1),
          ),
      enabledBorder: widget.enabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(color: gkColors.baseLight40, width: 1),
          ),
      focusedBorder: widget.focusedBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(color: gkColors.violet100, width: 2),
          ),
      hintText: widget.hintText,
      hintStyle: widget.hintStyle ??
          gkInterStyles.tffHint.copyWith(
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            color: widget.textColor ?? gkColors.black,
          ),
      suffixIcon: widget.isPassword
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: GkImageIconView(
                assetPath: gkImages.show,
                iconColor: _obscureText ? gkColors.baseLight20 : gkColors.violet100,
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
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label.isNotEmpty) ...[
            Text(
              widget.label,
              style: widget.labelStyle ?? GkInterStylesImp().tiny,
            ),
            GkSpacersImp().height4
          ],
          TextFormField(
            decoration: _getDecoration(),
            obscureText: widget.isPassword ? _obscureText : false,
            cursorColor: widget.cursorColor ?? gkColors.violet100,
            style: widget.style ??
                gkInterStyles.bodyTwo.copyWith(
                  fontWeight: widget.fontWeight,
                  fontSize: widget.fontSize,
                  color: widget.textColor ?? gkColors.black,
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
        ],
      ),
    );
  }
}
