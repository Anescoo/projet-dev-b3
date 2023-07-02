import 'package:dio/dio.dart';
import 'package:front/core/isar_service.dart';

class TokenInterceptor extends Interceptor {
  final IsarService isar;

  TokenInterceptor(this.isar);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// `super.onRequest(options, handler);` is calling the `onRequest` method of the parent class
    /// (`Interceptor`). This allows the parent class to perform any necessary logic before or after the
    /// `onRequest` method of the `TokenInterceptor` class is executed.
    // get the user from a source
    String? token = isar.getToken;
    // String token = "";
    //       options.headers[Headers.wwwAuthenticateHeader] = 'Bearer $token';

    // if (isar.userToken != "") {
    //   // if the user is not null  i can set his token

      options.headers['content-Type'] = 'application/json';
      options.headers["authorization"] = 'Bearer $token ?? ';
    // }else{
    //   print("no token bro");
    // }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    // final error = err.response?.data['error_code'];
    // if (error == userNotfound) {
    // }
    super.onError(err, handler);
  }
}
