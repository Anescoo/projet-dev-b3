import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:front/features/users/domain/entity/user.dart';

class UserModel extends User {
  final int? statusCode;
  final String? error;
  final List? message;
  UserModel({
    this.statusCode,
    this.error,
    this.message,
    required super.id,
    required super.token,
    String? usrname,
    String? email,
    String? password,
    bool? isAdmin,
    List<dynamic>? fav,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    final userMap = map['user'] as Map<String, dynamic>;

    return UserModel(
      token: map['access_token'] ?? '',
      id: userMap['userId'] ?? '',
      usrname: userMap['userName'] ?? '',
      email: userMap['email'] ?? '',
      password: userMap['password'] ?? '',
      isAdmin: userMap['isAdmin'] ?? false,
      statusCode: map['statusCode'] ?? 0,
      message: map['message'] ?? [],
      error: map['error'] ?? '',
    );
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
