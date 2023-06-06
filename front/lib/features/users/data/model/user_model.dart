import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:front/features/users/domain/entity/user.dart';

class UserModel extends User {
  final int? statusCode;
  final String? error;
  final Array? message;
  final RequestOptions? requestOptions;
  const UserModel({
    this.statusCode,
    String? token,
    String? usrname,
    String? email,
    String? password,
    bool? isAdmin,
    List? fav,
    String? id,
    this.error,
    this.message,
    this.requestOptions
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        token: map['access_token'] ?? '',
        usrname: map['username'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        isAdmin: map['isAdmin'] ?? false,
        statusCode: map['statusCode'] ?? 0,
        message: map['message'] ?? [],
        error: map['error'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': usrname,
      'email': email,
      'password': password,
      'isAdmin': isAdmin,
    };
  }
}
