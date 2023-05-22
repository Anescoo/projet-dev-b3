import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:front/features/auth/signin.dart';

class Client {
  late String token;
  final String baseUrl = 'https://nest-p82k.onrender.com';

  Client() {
    token = '';
  }

  Future<String> _getAuthorizationHeader() async {
    if (token.isNotEmpty) {
      return 'Bearer $token';
    }
    return '';
  }

  Future<http.Response> _get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = {'Authorization': await _getAuthorizationHeader()};
    return await http.get(url, headers: headers);
  }

  Future<http.Response> _post(String endpoint, dynamic data) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = {'Authorization': await _getAuthorizationHeader()};
    final body = jsonEncode(data);
    return await http.post(url, headers: headers, body: body);
  }

  Future<String> signUp(String username, String email, String pwd) async {
    final response = await _post('/API/V1/signUp',
        {'name': username, 'email': email, 'password': pwd});
    final responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      token = responseData['token'];
      return token;
    } else {
      throw Exception('Failed to sign up: ${responseData['error']}');
    }
  }

  Future<String> signIn(SignIn user) async {
    final response = await _post('/API/V1/signIn', user.toJson());
    final responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      token = responseData['access_token'];
      print(token);
      return token;
    } else {
      throw Exception('Failed to sign in: ${responseData['error']}');
    }
  }

  Future<String> pingServer() async {
    final response = await _get('/API/V1/');
    if (response.statusCode == 200 && response.body == 'pong') {
      return 'pong';
    } else {
      return 'Erreur : L\'utilisateur n\'est pas authentifié.';
    }
  }

  // Reste des méthodes à implémenter...

  Future<String> getAllProducts() async {
    // À implémenter
    return '';
  }

  Future<String> getUsersData() async {
    // À implémenter
    return '';
  }

  Future<String> deleteAccount() async {
    // À implémenter
    return '';
  }

  Future<String> getAllOrders() async {
    // À implémenter
    return '';
  }

  String getSomeProducts() {
    // À implémenter
    return '';
  }

  String getMostLikedProduct() {
    // À implémenter
    return '';
  }
}
