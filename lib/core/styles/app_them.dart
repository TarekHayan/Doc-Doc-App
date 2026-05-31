import 'package:flutter/material.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';

class AppThem {
  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primaryColorBlue,
    scaffoldBackgroundColor: AppColors.secondaryColorWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryColorWhite,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppFonts.fontSize18SimiBlack,
    ),
  );
}
