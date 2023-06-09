import 'package:dio/dio.dart';
import 'package:front/core/constatns.dart';
import 'package:front/features/users/data/model/user_model.dart';
import 'package:retrofit/http.dart';

part 'auth_user_api_service.g.dart';

//! command to build : dart run build_runner build
//* Inputs are models because we create a data structure to make the request and receive response
//* Return : The result data , the upper layer determine if it is a success or failur
@RestApi(baseUrl: baseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  ///*usr { "email": "testoy@gmail.com","password": "testoy64"}
  @POST("/API/V1/signIn")
  Future<UserModel> signIn(@Body() UserModel usr);

  ///* newUser {"email":"testoy@gmail.com","password": "testoy64","userName": "test","isAdmin":false}
  @POST("/API/V1/signUp")
  Future<UserModel> signUp(@Body() UserModel newUser);

  @DELETE("/API/V1//removeUsers/{id}")
  Future<String> removeUser(
      @Path() String id, @Header('Authorization') String token);

  @PATCH("/API/V1/update")
  Future<UserModel> updateUser(
      @Body() UserModel usr, @Header('Authorization') String token);
}
