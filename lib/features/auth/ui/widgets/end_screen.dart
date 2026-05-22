import 'package:flutter/material.dart';
import 'package:project_app/core/helper/nav_extension.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/routes/routes.dart';
import 'package:project_app/core/styles/app_fonts.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key, required this.isLoginScreen});
  final bool isLoginScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTermsAndConditionsAndPrivacyPolicy(),
        vSpace(41),
        _dontHaveAnAccount(context, isLoginScreen),
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

  Widget _dontHaveAnAccount(BuildContext context, bool isLoginScreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isLoginScreen
            ? Text(
                "Don't have an account? ",
                style: AppFonts.fontSize12RegularBlack,
              )
            : Text(
                "Already have an account? ",
                style: AppFonts.fontSize12RegularBlack,
              ),
        isLoginScreen
            ? TextButton(
                onPressed: () {
                  context.navigateTo(routeName: Routes.register);
                },
                child: Text("Sign Up", style: AppFonts.fontSize11SemiBlue),
              )
            : TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text("Sign In", style: AppFonts.fontSize11SemiBlue),
              ),
      ],
    );
  }
}
