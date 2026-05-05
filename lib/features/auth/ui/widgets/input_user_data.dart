import 'package:flutter/material.dart';
import 'package:project_app/core/helper/spacing.dart';
import 'package:project_app/core/styles/app_fonts.dart';
import 'package:project_app/core/widgets/app_custom_text_form_field.dart';

class InputUserData extends StatelessWidget {
  const InputUserData({super.key, required this.form});
  final GlobalKey<FormState> form;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        children: [
          CustomTextField(hintText: "Email", isObscureText: false),
          vSpace(16),
          CustomTextField(hintText: "Password", isObscureText: true),
          vSpace(16),
          TextButton(
            onPressed: () {},
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                "Forgot Password?",
                style: AppFonts.fontSize13RegularBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
