import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/core/helper/app_regex.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/styles/app_fonts.dart';
import 'package:project_app/core/widgets/app_custom_text_field.dart';
import 'package:project_app/features/auth/logic/cubit/login_cubit.dart';
import 'package:project_app/features/auth/ui/widgets/password_validations.dart';

class InputUserData extends StatelessWidget {
  const InputUserData({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          EmailTextField(),
          vSpace(16),
          PasswordTextField(),
          vSpace(16),
          ForgetPasswordTextButton(),
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
  @override
  void initState() {
    context.read<LoginCubit>().passwordController.addListener(() {
      final password = context.read<LoginCubit>().passwordController.text;
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(password);
        hasUpperCase = AppRegex.hasUpperCase(password);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(password);
        hasNumber = AppRegex.hasNumber(password);
        hasMinLength = AppRegex.hasMinLength(password);
      });
    });
    super.initState();
  }

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool isObscureText = false;

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
              isObscureText ? Icons.visibility : Icons.visibility_off,
              color: isObscureText
                  ? AppColors.primaryColorBlue
                  : AppColors.greyColor,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password is required";
            }
            if (!AppRegex.isPasswordValid(value)) {
              return "Password does not meet the requirements";
            }

            return null;
          },
        ),
        vSpace(24),
        PasswordValidations(
          hasLowerCase: hasLowerCase,
          hasUpperCase: hasUpperCase,
          hasSpecialCharacters: hasSpecialCharacters,
          hasNumber: hasNumber,
          hasMinLength: hasMinLength,
        ),
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
