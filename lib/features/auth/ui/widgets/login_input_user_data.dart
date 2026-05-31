import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/core/helper/app_regex.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';
import 'package:project_app/core/widgets/app_custom_text_field.dart';
import 'package:project_app/features/auth/logic/cubit/login_cubit.dart';

class LogInInputUserData extends StatelessWidget {
  const LogInInputUserData({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          const EmailTextField(),
          vSpace(16),
          const PasswordTextField(),
          const ForgetPasswordTextButton(),
        ],
      ),
    );
  }
}

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Text("Forgot Password?", style: AppFonts.fontSize13RegularBlue),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: context.read<LoginCubit>().passwordController,
          hintText: "Password",
          isObscureText: isObscureText,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            icon: Icon(
              isObscureText ? Icons.visibility_off : Icons.visibility,
              color: isObscureText
                  ? AppColors.greyColor
                  : AppColors.primaryColorBlue,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password is required";
            }

            return null;
          },
        ),
        vSpace(24),
      ],
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: context.read<LoginCubit>().emailController,
      hintText: "Email",
      isObscureText: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email is required";
        }
        if (!AppRegex.isEmailValid(value)) {
          return "Please enter a valid email";
        }
        return null;
      },
    );
  }
}
