import 'package:front/features/auth/domain/entity/user.dart';
class AuthModel extends User {
  const AuthModel(
      {String? token,
      String? usrname,
      String? email,
      String? password,
      bool? isAdmin,
      List? fav,
      String? id});

    factory AuthModel.fromJson(Map<String,dynamic> map){
      return AuthModel(
        token: map['access_token'] ?? '',
        usrname: map['username'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        isAdmin: map['isAdmin'] ?? '',
      );
    }

}
