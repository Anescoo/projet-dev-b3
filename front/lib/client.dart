import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

/**
 * 1- recup des données sur l'api
 * 2- incercion dans hive
 * 3- récup des données sur hive et ttes les autres requètes vers hive
 */
class Client {
  final dio = Dio();
  late String token = '';
  var box;

  var url = Uri.https('nest-p82k.onrender.com', '/API/V1/');
// var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});

  Client() {
    dio.options.baseUrl = 'https://nest-p82k.onrender.com';
    Hive.initFlutter();
  }

  void addToken(String value) async {
    var box = await Hive.openBox('testBox');
    box.put("token", value);
  }

  Future<String> getToken(String key) async {
    var res = box.get('token');
    print(res);
    return res['token'];
  }

  static void setHeader(Dio dio, token) {
    // Ajouter un intercepteur global
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Ajouter le jeton d'authentification à chaque requête
        options.headers["Authorization"] = "Bearer $token";
        return handler.next(options);
      },
    ));
  }

  /// Tester le fonctionnement de l'apoi
  void request() async {
    Response response;
    Map result = {};

    try {
      response = await dio.get('/API/V1/');
      result = response.data;
      // ignore: avoid_print
      print(response.data.toString());
    } catch (error) {
      // Gérer d'autres types d'erreurs ici
      result = {"result": "random error"};
    }
    print(result);
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
    var test;
    Map result = {};
    Map<String, dynamic> val = {};

    try {
      response = await dio.post('/API/V1/signIn', data: user.toJson());
      // test = await http.post(url, body: user);
      // print('Response body: ${test.body}');

      val = response.data;
      if (response.statusCode == 200) {
        result = {"result": "ok"};
        // Récupérer le jeton d'authentification
        token = val["access_token"];
        var box = await Hive.openBox('testBox');

        box.put('token', token);

        print('Name: ${box.get('token')}');
        box.close();
        setHeader(dio, token);
      }
    } on DioError catch (error) {
      // Gérer les erreurs spécifiques à DioError ici
      if (error.response != null) {
        // Erreur associée à une réponse HTTP
        result = {"result": "${error.response}"};
      } else if (error.requestOptions != null) {
        // Erreur liée à la requête
        result = {"result": "${error.requestOptions.uri}"};
      }
      print("Message d'erreur général: ${error.message}");
    } catch (error) {
      // Gérer d'autres types d'erreurs ici
      result = {"result": "random error"};
    }
    print(result);
    return result;
  }

Future<String> pingServer() async {
  try {
    var box = await Hive.openBox('testBox');
    var token = box.get('token');
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Ajouter le jeton d'autorisation à chaque requête
        options.headers["Authorization"] = "Bearer $token";
        return handler.next(options);
      },
    ));
    print("ping ici");
    final response = await dio.get('/API/V1/getAllProduct');
    print(response.data);

    if (response.statusCode == 200 && response.data == "pong") {
      return "pong";
    } else {
      return "Erreur : L'utilisateur n'est pas authentifié.";
    }
  } on DioError catch (error) {
    // Gérer les erreurs spécifiques à DioError ici
    if (error.response != null) {
      // Erreur associée à une réponse HTTP
      return "Erreur : ${error.response}";
    } else if (error.requestOptions != null) {
      // Erreur liée à la requête
      return "Erreur : ${error.requestOptions.uri}";
    } else {
      return "Erreur aléatoire.";
    }
  } catch (error) {
    // Gérer d'autres types d'erreurs ici
    return "Erreur aléatoire.";
  }
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

class SignIn {
}
