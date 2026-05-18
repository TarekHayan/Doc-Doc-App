import 'package:dio/dio.dart';
import 'package:project_app/core/networking/api_constants.dart';
import 'package:project_app/features/auth/data/models/login_request_body.dart';
import 'package:project_app/features/auth/data/models/login_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_serviece.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponse> login({
    @Body() required LoginRequestBody loginRequestBody,
  });
}
