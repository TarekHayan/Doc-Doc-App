import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_app/core/networking/api_error_handler.dart';
part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success;
  const factory ApiResult.failure(ErrorHandler error) = Failure;
}
