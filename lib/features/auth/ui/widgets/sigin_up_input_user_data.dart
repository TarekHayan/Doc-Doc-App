import 'package:flutter/material.dart';
import 'package:project_app/core/helper/app_regex.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/styles/app_colors.dart';
import 'package:project_app/core/widgets/app_custom_text_field.dart';
import 'package:project_app/features/auth/ui/widgets/custom_drop_dowen.dart';
import 'package:project_app/features/auth/ui/widgets/password_validations.dart';

class SiginUpInputUserData extends StatelessWidget {
  SiginUpInputUserData({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          NameTextField(),
          vSpace(16),
          PhoneTextField(),
          vSpace(16),
          GenderTextField(),
          vSpace(16),
          EmailTextField(),
          vSpace(16),
          PasswordTextField(),
          vSpace(16),
          ConfirmPasswordTextField(),
        ],
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
  // void initState() {
  //   context.read<LoginCubit>().passwordController.addListener(() {
  //     final password = context.read<LoginCubit>().passwordController.text;
  //     setState(() {
  //       hasLowerCase = AppRegex.hasLowerCase(password);
  //       hasUpperCase = AppRegex.hasUpperCase(password);
  //       hasSpecialCharacters = AppRegex.hasSpecialCharacter(password);
  //       hasNumber = AppRegex.hasNumber(password);
  //       hasMinLength = AppRegex.hasMinLength(password);
  //     });
  //   });
  //   super.initState();
  // }
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
          // controller: context.read<LoginCubit>().passwordController,
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

class NameTextField extends StatelessWidget {
  const NameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      // controller: context.read<LoginCubit>().emailController,
      hintText: "Name",
      isObscureText: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name is required";
        }
        if (!AppRegex.hasMinLength(value)) {
          return "Please enter a name with at least 8 characters";
        }
        return null;
      },
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      // controller: context.read<LoginCubit>().emailController,
      hintText: "Phone",
      isObscureText: false,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Phone is required";
        }
        if (!AppRegex.isPhoneNumberValid(value)) {
          return "Please enter a valid phone number";
        }
        return null;
      },
    );
  }
}

class GenderTextField extends StatelessWidget {
  const GenderTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GenderDropDown();
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      // controller: context.read<LoginCubit>().emailController,
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

class ConfirmPasswordTextField extends StatefulWidget {
  const ConfirmPasswordTextField({super.key});

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          // controller: context.read<LoginCubit>().passwordController,
          hintText: "Confirm Password",
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

            return null;
          },
        ),
      ],
    );
  }
}
