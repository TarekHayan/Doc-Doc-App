import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/widgets/app_custom_elvated_button.dart';
import 'package:project_app/features/auth/data/models/login_request_body.dart';
import 'package:project_app/features/auth/logic/cubit/login_cubit.dart';
import 'package:project_app/features/auth/ui/widgets/end_screen.dart';
import 'package:project_app/features/auth/ui/widgets/login_input_user_data.dart';
import 'package:project_app/features/auth/ui/widgets/login_bloc_listener.dart';
import 'package:project_app/features/auth/ui/widgets/auth_screen_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AuthScreenHeader(
                  title: r'Welcome Back',
                  desc:
                      'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                ),
                vSpace(36),
                const LogInInputUserData(),
                vSpace(41),
                CustomElevatedButton(
                  title: "Login",
                  onPressed: () {
                    _validateAndLogin(context);
                  },
                ),
                vSpace(32),
                EndScreen(isLoginScreen: true),
                LoginBlockListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
