import 'package:dio/dio.dart';
import 'package:front/core/token_interceptor.dart';
import 'package:front/core/constatns.dart';
import 'package:front/core/isar_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final dio = Dio();
  Dio buildDioClient(IsarService isar) {
    dio.options = BaseOptions(baseUrl: baseUrl);
    dio.interceptors.addAll([PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90),TokenInterceptor(isar)]); 
      return dio;
  }
}
