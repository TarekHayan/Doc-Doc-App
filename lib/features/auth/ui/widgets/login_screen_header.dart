import 'package:flutter/material.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';

class LoginScreenHeader extends StatelessWidget {
  const LoginScreenHeader({super.key, required this.title, required this.desc});
  final String title, desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.fontSize24BoldPrim,
          textAlign: TextAlign.left,
        ),
        vSpace(8),
        Text(
          desc,
          style: AppFonts.fontSize14RegularBlack.copyWith(
            color: AppColors.lightGreyColor,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
