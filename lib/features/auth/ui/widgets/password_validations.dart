import 'package:flutter/material.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        vSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        vSpace(2),
        buildValidationRow(
          'At least 1 special character',
          hasSpecialCharacters,
        ),
        vSpace(2),
        buildValidationRow('At least 1 number', hasNumber),
        vSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(radius: 2.5, backgroundColor: AppColors.greyColor),
        hSpace(6),
        Text(
          text,
          style: AppFonts.fontSize13RegularBlue.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated
                ? AppColors.greyColor
                : AppColors.primaryColorBlue,
          ),
        ),
      ],
    );
  }
}
