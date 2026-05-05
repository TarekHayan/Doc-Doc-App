import 'package:flutter/material.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/styles/app_fonts.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTermsAndConditionsAndPrivacyPolicy(),
        vSpace(41),
        _dontHaveAnAccount(),
      ],
    );
  }

  Widget _buildTermsAndConditionsAndPrivacyPolicy() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "By signing up, you agree to our ",
        style: AppFonts.fontSize11RegularmidGray,
        children: [
          TextSpan(
            text: "Terms and Conditions",
            style: AppFonts.fontSize11MediumBlack,
          ),
          TextSpan(text: " and ", style: AppFonts.fontSize11RegularmidGray),
          TextSpan(
            text: "Privacy Policy",
            style: AppFonts.fontSize11MediumBlack,
          ),
        ],
      ),
    );
  }

  Widget _dontHaveAnAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: AppFonts.fontSize12RegularBlack),
        Text("Sign Up", style: AppFonts.fontSize11SemiBlue),
      ],
    );
  }
}
