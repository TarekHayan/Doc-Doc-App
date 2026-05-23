import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/widgets/app_custom_elvated_button.dart';
import 'package:project_app/features/auth/data/models/login_request_body.dart';
import 'package:project_app/features/auth/data/models/signup_request_body.dart';
import 'package:project_app/features/auth/logic/cubit/login_cubit.dart';
import 'package:project_app/features/auth/logic/cubit/signup_cubit.dart';
import 'package:project_app/features/auth/ui/widgets/end_screen.dart';
import 'package:project_app/features/auth/ui/widgets/auth_screen_header.dart';
import 'package:project_app/features/auth/ui/widgets/sigin_up_input_user_data.dart';
import 'package:project_app/features/auth/ui/widgets/signup_bloc_listener.dart';

class SiginUpScreen extends StatelessWidget {
  const SiginUpScreen({super.key});

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
                  title: r'Create Account',
                  desc:
                      "Sign up now and start exploring all that our \n app has to offer. We're excited to welcome \n you to our community!",
                ),
                vSpace(36),
                SiginUpInputUserData(),
                vSpace(41),
                CustomElevatedButton(
                  title: "Sign Up",
                  onPressed: () {
                    _validateAndSignup(context);
                  },
                ),
                vSpace(32),
                EndScreen(isLoginScreen: false),
                SignupBlockListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _validateAndSignup(BuildContext context) {
  if (context.read<SignupCubit>().formKey.currentState!.validate()) {
    context.read<SignupCubit>().emitSignupState();
  }
}
