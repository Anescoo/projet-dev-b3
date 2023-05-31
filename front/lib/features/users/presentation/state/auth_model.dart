
import 'package:flutter/material.dart';
import 'package:front/client.dart';
import 'package:front/features/users/data/model/signin.dart';

class AuthModel extends ChangeNotifier {
  Client api = Client();

  // Future<String> signin(SignIn user){
  //     return api.signIn(user);
  // }
}