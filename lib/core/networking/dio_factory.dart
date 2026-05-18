import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      final Duration timeout = const Duration(seconds: 10);
      dio!.options.connectTimeout = timeout;
      dio!.options.receiveTimeout = timeout;
      addPrettyDioLogger();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addPrettyDioLogger() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}
