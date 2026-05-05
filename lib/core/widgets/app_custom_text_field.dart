import 'package:flutter/material.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';

class CustomTextField extends StatefulWidget {
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
  });
  final String hintText;
  final bool isObscureText;
  final Color? cursorColor;
  final Color? fillColor;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final IconButton? obscureTextIconButton;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: widget.cursorColor ?? AppColors.blackColor,
      obscureText: widget.isObscureText ? obscureText : false,
      decoration: InputDecoration(
        fillColor: widget.fillColor ?? AppColors.morelighterGreyColor,
        filled: true,
        suffixIcon:
            widget.suffixIcon ??
            (widget.isObscureText ? obscureTextIcon() : null),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? AppFonts.fontSize14RegularLightGray,
        enabledBorder:
            widget.enabledBorder ?? borderRadius(AppColors.lighterGreyColor),
        focusedBorder:
            widget.focusedBorder ?? borderRadius(AppColors.primaryColorBlue),
      ),
    );
  }

  Widget obscureTextIcon() {
    return widget.obscureTextIconButton ??
        IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: obscureText
                ? AppColors.lightGreyColor
                : AppColors.primaryColorBlue,
          ),
        );
  }

  OutlineInputBorder borderRadius(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: 1.3),
    );
  }
}
