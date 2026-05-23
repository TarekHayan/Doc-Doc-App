import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project_app/core/networking/api_result.dart';
import 'package:project_app/features/auth/data/models/login_request_body.dart';
import 'package:project_app/features/auth/data/repos/login_repo.dart';
import 'package:project_app/features/auth/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  final LoginRepo _loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (data) => emit(LoginState.success(data)),
      failure: (error) => emit(LoginState.failure(error.apiErrorModel.message)),
    );
  }

  @override
  Future<void> close() async {
    super.close();
    emailController.dispose();
    passwordController.dispose();
  }
}
