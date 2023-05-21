// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
    final String email;
    final String password;
    final String userName;
    final bool isAdmin;

    SignUp({
        required this.email,
        required this.password,
        required this.userName,
        required this.isAdmin,
    });

    factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        email: json["email"],
        password: json["password"],
        userName: json["userName"],
        isAdmin: json["isAdmin"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "userName": userName,
        "isAdmin": isAdmin,
    };
}
