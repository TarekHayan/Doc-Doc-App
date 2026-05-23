import 'package:project_app/core/networking/api_error_handler.dart';
import 'package:project_app/core/networking/api_result.dart';
import 'package:project_app/core/networking/api_serviece.dart';
import 'package:project_app/features/auth/data/models/signup_request_body.dart';
import 'package:project_app/features/auth/data/models/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signUp(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signup(
        signupRequestBody: signupRequestBody,
      );
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
