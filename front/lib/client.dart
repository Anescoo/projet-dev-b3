import 'package:dio/dio.dart';

class Client {
  final dio = Dio();
  //TODO: Gerer le fait que l'api sleep
  Api() {
    dio.options.baseUrl = 'https://nest-p82k.onrender.com';
  }
  /// Tester le fonctionnement de l'apoi
  Future<String> request() async {
    Response response;
    response = await dio.get('/');
    // ignore: avoid_print
    print(response.data.toString());
    // // The below request is the same as above.
    // response = await dio.get(
    //   '/test',
    //   queryParameters: {'id': 12, 'name': 'dio'},
    // );
    // print(response.data.toString());
    return response.data.toString();
  }

/// Create a user account
/// @return auth token
  Future<String> register(String username, String email, String pwd) async {
    Response response;
    response = await dio.post('/api/v1/auth/register',
        data: {"name": username, "email": email, "password": pwd});
    Map<String, dynamic> val = response.data;

    return val["token"];
  }

  Future<Object> registerObj(String username, String email, String pwd) async {
    Response response;
    response = await dio.post('/api/v1/auth/register',
        data: {"name": username, "email": email, "password": pwd});
    return response.data;
  }

  Future<String> login(String email, String pwd) async {
    Response response;
    response = await dio.post('/api/v1/auth/authenticate',
        data: {"email": email, "password": pwd});
    Map<String, dynamic> val = response.data;

    return val["token"];  }
}
