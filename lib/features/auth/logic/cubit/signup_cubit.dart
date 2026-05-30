import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_app/core/networking/api_result.dart';
import 'package:project_app/features/auth/data/models/signup_request_body.dart';
import 'package:project_app/features/auth/data/models/signup_response.dart';
import 'package:project_app/features/auth/data/repos/signup_repo.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(SignupRepo signupRepo)
    : _signupRepo = signupRepo,
      super(const SignupState.initial());

  String? selectedGender;
  String changeGender(String? value) {
    if (value == "Male") {
      return '0';
    }
    if (value == "Female") {
      return '1';
    }
    return '';
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final SignupRepo _signupRepo;
  void emitSignupState() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signUp(
      SignupRequestBody(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text,
        gender: changeGender(selectedGender),
        confirmPassword: confirmPasswordController.text,
      ),
    );
    response.when(
      success: (data) => emit(SignupState.success(data)),
      failure: (error) =>
          emit(SignupState.failure(error.apiErrorModel.message)),
    );
  }

  @override
  Future<void> close() async {
    super.close();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }
}
