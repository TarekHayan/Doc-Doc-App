import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_app/core/helper/nav_extension.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/routes/routes.dart';
import 'package:project_app/core/widgets/app_custom_elvated_button.dart';
import 'package:project_app/features/auth/ui/widgets/end_screen.dart';
import 'package:project_app/features/auth/ui/widgets/input_user_data.dart';
import 'package:project_app/features/auth/ui/widgets/login_screen_header.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LoginScreenHeader(
                  title: r'Welcome Back',
                  desc:
                      'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                ),
                vSpace(36),
                InputUserData(form: form),
                vSpace(41),
                CustomElevatedButton(
                  title: "Login",
                  onPressed: () {
                    context.navigateTo(routeName: Routes.home);
                  },
                ),
                vSpace(32),
                EndScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
