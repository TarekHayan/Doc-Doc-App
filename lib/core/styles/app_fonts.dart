import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_app/core/helper/font_wight_helper.dart';
import 'package:project_app/core/styles/app_colors.dart';

class AppFonts {
  static TextStyle fontSize32BoldPrim = TextStyle(
    fontSize: 32.sp,
    color: AppColors.primaryColorBlue,
    fontWeight: FontWightHelper.bold,
  );

  static TextStyle fontSize24BoldPrim = TextStyle(
    fontSize: 24.sp,
    color: AppColors.primaryColorBlue,
    fontWeight: FontWightHelper.bold,
  );

  static TextStyle fontSize18SimiBlack = TextStyle(
    fontSize: 18.sp,
    color: AppColors.blackColor,
    fontWeight: FontWightHelper.semiBold,
  );

  static TextStyle fontSize16SimiBlack = TextStyle(
    fontSize: 16.sp,
    color: AppColors.blackColor,
    fontWeight: FontWightHelper.semiBold,
  );

  static TextStyle fontSize14RegularBlack = TextStyle(
    fontSize: 14.sp,
    color: AppColors.blackColor,
    fontWeight: FontWightHelper.regular,
  );

  static TextStyle fontSize14RegularLightGray = TextStyle(
    fontSize: 14.sp,
    color: AppColors.lightGreyColor,
    fontWeight: FontWightHelper.regular,
  );

  static TextStyle fontSize12RegularBlack = TextStyle(
    fontSize: 12.sp,
    color: AppColors.blackColor,
    fontWeight: FontWightHelper.regular,
  );
  static TextStyle fontSize13RegularBlue = TextStyle(
    fontSize: 13.sp,
    color: AppColors.primaryColorBlue,
    fontWeight: FontWightHelper.regular,
  );

  static TextStyle fontSize11RegularmidGray = TextStyle(
    fontSize: 11.sp,
    color: AppColors.mediumlighterGreyColor,
    fontWeight: FontWightHelper.regular,
  );

  static TextStyle fontSize11MediumBlack = TextStyle(
    fontSize: 11.sp,
    color: AppColors.blackColor,
    fontWeight: FontWightHelper.medium,
  );
  static TextStyle fontSize11SemiBlue = TextStyle(
    fontSize: 11.sp,
    color: AppColors.primaryColorBlue,
    fontWeight: FontWightHelper.semiBold,
  );
}
