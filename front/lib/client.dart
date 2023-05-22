import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:front/features/auth/signin.dart';

class Client {
  final Dio dio = Dio();
  String token = '';
  final String baseUrl = 'https://nest-p82k.onrender.com';

  Client() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Ajouter le jeton d'authentification à chaque requête
        if (token.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $token";
        }
        return handler.next(options);
      },
    ));
  }

  Future<Map<String, dynamic>> signIn(SignIn user) async {
    try {
      final response =
          await dio.post('/API/V1/signIn', data: user.toJson()).then((value) {
        dio.options.headers = {'Authorization': token};
      });
      final val = response.data;
      if (response.statusCode == 200) {
        token = val["access_token"];
        return {"result": "ok"};
      } else {
        return {"result": "error"};
      }
    } on DioError catch (error) {
      // Gérer les erreurs spécifiques à DioError ici
      if (error.response != null) {
        // Erreur associée à une réponse HTTP
        return {"result": "${error.response}"};
      } else if (error.requestOptions != null) {
        // Erreur liée à la requête
        return {"result": "${error.requestOptions.uri}"};
      } else {
        return {"result": "random error"};
      }
    } catch (error) {
      // Gérer d'autres types d'erreurs ici
      return {"result": "random error"};
    }
  }

  Future<Map<String, dynamic>> signUp(
      String username, String email, String pwd) async {
    try {
      final response = await dio.post('/API/V1/signUp',
          data: {"name": username, "email": email, "password": pwd});
      final val = response.data;
      if (response.statusCode == 200) {
        token = val["token"];
        return {"result": "ok"};
      } else {
        return {"result": "error"};
      }
    } on DioError catch (error) {
      // Gérer les erreurs spécifiques à DioError ici
      if (error.response != null) {
        // Erreur associée à une réponse HTTP
        return {"result": "${error.response}"};
      } else if (error.requestOptions != null) {
        // Erreur liée à la requête
        return {"result": "${error.requestOptions.uri}"};
      } else {
        return {"result": "random error"};
      }
    } catch (error) {
      // Gérer d'autres types d'erreurs ici
      return {"result": "random error"};
    }
  }

  void checkToken() {
    final dioHttpClientAdapter = dio.httpClientAdapter as IOHttpClientAdapter;
    final tokenHeader = dio.options.headers['Authorization'];
    if (tokenHeader != null && tokenHeader.toString().isNotEmpty) {
      print(
          "Le jeton d'authentification est présent dans l'en-tête de la requête.");
    } else {
      print(
          "Le jeton d'authentification n'est pas présent dans l'en-tête de la requête.");
    }
  }

  Future<String> pingServer() async {
    try {
      final response = await dio.get('/API/V1/');
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
}
