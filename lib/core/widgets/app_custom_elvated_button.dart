import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonStyle,
    this.buttomTextStyle,
  });
  final String title;
  final void Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttomTextStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:
          buttonStyle ??
          ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColorBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(vertical: 16.h),
          ),
      child: Center(
        child: Text(
          title,
          style:
              buttomTextStyle ??
              AppFonts.fontSize16SimiBlack.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
