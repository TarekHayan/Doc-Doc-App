import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';
import 'package:project_app/features/on_bording/ui/widgets/get_started_button.dart';

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
          SizedBox(height: 32.h),
          GetStartedButton(),
        ],
      ),
    );
  }
}
