import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/core/routes/routes.dart';
import 'package:project_app/features/auth/logic/cubit/signup_cubit.dart';

class SignupBlockListener extends StatelessWidget {
  const SignupBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Success || current is Failure || current is Loading,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
          success: (response) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(Routes.home);
          },
          failure: (error) {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Signup Failed"),
                content: Text(error),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
