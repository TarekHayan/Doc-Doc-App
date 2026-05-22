import 'package:flutter/material.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.isObscureText,
    this.cursorColor,
    this.fillColor,
    this.suffixIcon,
    this.hintStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.obscureTextIconButton,
    this.controller,
    required this.validator,
    this.errorBorder,
    this.focusedErrorBorder,
    this.keyboardType,
  });
  final String hintText;
  final bool isObscureText;
  final Color? cursorColor;
  final Color? fillColor;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final IconButton? obscureTextIconButton;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: (value) {
        return validator(value);
      },
      controller: controller,
      cursorColor: cursorColor ?? AppColors.blackColor,
      obscureText: isObscureText,
      decoration: _inputDecoration(),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      fillColor: fillColor ?? AppColors.morelighterGreyColor,
      filled: true,
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle: hintStyle ?? AppFonts.fontSize14RegularLightGray,
      enabledBorder: enabledBorder ?? _borderRadius(AppColors.lighterGreyColor),
      focusedBorder: focusedBorder ?? _borderRadius(AppColors.primaryColorBlue),
      errorBorder: errorBorder ?? _borderRadius(Colors.redAccent),
      focusedErrorBorder: focusedErrorBorder ?? _borderRadius(Colors.redAccent),
    );
  }

  // Widget _obscureTextIcon() {
  OutlineInputBorder _borderRadius(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: 1.3),
    );
  }
}
