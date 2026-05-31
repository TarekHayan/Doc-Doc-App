part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success(SignupResponse response) = Success;
  const factory SignupState.failure(String error) = Failure;
}
