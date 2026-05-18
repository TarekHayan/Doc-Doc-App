import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project_app/core/networking/api_serviece.dart';
import 'package:project_app/core/networking/dio_factory.dart';
import 'package:project_app/features/auth/data/repos/login_repo.dart';
import 'package:project_app/features/auth/logic/cubit/login_cubit.dart';

final GetIt getIt = GetIt.instance;
Future<void> setupDependencyInjection() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt.get<ApiService>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<LoginRepo>()));
}
