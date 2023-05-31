import 'dart:io';

import 'package:dio/dio.dart';
import 'package:front/core/constatns.dart';
import 'package:front/features/users/data/model/user.dart';
import 'package:front/features/users/presentation/state/auth_model.dart';
import 'package:retrofit/http.dart';

part 'auth_user_api_service.g.dart';

@RestApi(baseUrl: baseUrl )
abstract class AuthUserApiService {
  factory AuthUserApiService(Dio dio) = _AuthUserApiService;

  @POST("/API/V1/signIn")
  Future<UserModel> login(@Body() UserModel authModel);
}