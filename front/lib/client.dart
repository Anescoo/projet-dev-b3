import 'package:dio/dio.dart';
import 'package:front/features/auth/signin.dart';

class Client {
  final dio = Dio();
  late String token = '';

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
    //TODO ajouter le token d'authentification auw requettes

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["Authorization"] = "Bearer ${val["token"]}";
        return handler.next(options);
      },
    ));
    return val["token"];
  }

  Future<Map> signIn(SignIn user) async {
    Response response;
    Map result = {};
 Map<String, dynamic> val;

    try {
      response = await dio.post('/API/V1/signIn', data: user.toJson());
      val = response.data;
      if (response.statusCode == 200) {
        result = {"result": "ok"};
      }
    } on DioError catch (error) {
      // Gérer les erreurs spécifiques à DioError ici
      if (error.response != null) {
        // Erreur associée à une réponse HTTP
        result ={"result":  "${error.response}"};
      } else if (error.requestOptions != null) {
        // Erreur liée à la requête
        result = {"result": "${error.requestOptions.uri}"};
      }
      print("Message d'erreur général: ${error.message}");
    } catch (error) {
      // Gérer d'autres types d'erreurs ici
      result = {"result": "random error"};
    }
    //TODO ajouter le token d'authentification auw requettes

    // dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     options.headers["Authorization"] = "Bearer ${val["access_token"]}";
    //     return handler.next(options);
    //   },
    // ));
    // print(val["access_token"]);
    print(result);
    return result;
  }

  //TODO
  Future<String> getAllProducts() async {
    return '';
  }

  //TODO
  Future<String> getUsersData() async {
    return '';
  }

  //TODO
  Future<String> deleteAccunt() async {
    return '';
  }

  //TODO
  Future<String> getAllOrders() async {
    return '';
  }

  //TODO GET the 5 first product on the bdd

  String getSomeProducts() {
    return '';
  }

  //TODO get the most liked product
  String getMostLikedProduct() {
    return '';
  }
}
