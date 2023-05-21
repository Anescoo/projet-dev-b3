import 'package:dio/dio.dart';

class Client {
  final dio = Dio();
  //TODO: Gerer le fait que l'api sleep
  Client() {
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
  Future<String> signUp(String username, String email, String pwd) async {
    Response response;
    response = await dio.post('/API/V1/signUp',
        data: {"name": username, "email": email, "password": pwd});
    Map<String, dynamic> val = response.data;

    return val["token"];
  }

  Future<String> signIn(String email, String pwd) async {
    Response response;
    response = await dio
        .post('/API/V1/signIn', data: {"email": email, "password": pwd});
    Map<String, dynamic> val = response.data;

    return val["token"];
  }


  //TODO
  Future<String> getAllProducts() async { return ''; }

    //TODO
  Future<String> getUsersData() async { return ''; }

    //TODO
  Future<String> deleteAccunt() async { return ''; }

    //TODO
  Future<String> getAllOrders() async { return ''; }
}
