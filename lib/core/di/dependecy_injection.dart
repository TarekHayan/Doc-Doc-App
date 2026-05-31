import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project_app/core/networking/api_serviece.dart';
import 'package:project_app/core/networking/dio_factory.dart';
import 'package:project_app/features/auth/data/repos/login_repo.dart';
import 'package:project_app/features/auth/data/repos/signup_repo.dart';
import 'package:project_app/features/auth/logic/cubit/login_cubit.dart';
import 'package:project_app/features/auth/logic/cubit/signup_cubit.dart';

final GetIt getIt = GetIt.instance;
Future<void> setupDependencyInjection() async {
  // Register Dio and ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login dependencies
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt.get<ApiService>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<LoginRepo>()));

  // Signup dependencies
  getIt.registerLazySingleton<SignupRepo>(
    () => SignupRepo(getIt.get<ApiService>()),
  );
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(getIt.get<SignupRepo>()),
  );
}
