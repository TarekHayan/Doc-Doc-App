import 'package:flutter/material.dart';
import 'package:project_app/core/helper/nav_extension.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/routes/routes.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';
import 'package:project_app/core/widgets/app_custom_elvated_button.dart';

class TextAndButton extends StatelessWidget {
  const TextAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
            textAlign: TextAlign.center,
            style: AppFonts.fontSize12RegularBlack.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          vSpace(32),
          CustomElevatedButton(
            title: "Get Started",
            onPressed: () => context.navigateTo(routeName: Routes.login),
          ),
        ],
      ),
    );
  }
}
