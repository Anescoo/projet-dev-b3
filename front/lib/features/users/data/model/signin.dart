// To parse this JSON data, do
//
//     final signIn = signInFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn data) => json.encode(data.toJson());

class SignIn {
    final String email;
    final String password;

    SignIn({
        required this.email,
        required this.password,
    });

    factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
