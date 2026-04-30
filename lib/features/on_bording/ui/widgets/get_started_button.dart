import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_app/core/helper/nav_extension.dart';
import 'package:project_app/core/routes/routes.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.navigateTo(routeName: Routes.home),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColorBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(vertical: 16.h),
      ),
      child: Center(
        child: Text(
          "Get Started",
          style: AppFonts.fontSize16SimiBlack.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
