
import 'package:front/features/auth/domain/entity/user.dart';

class UserModel extends User {
  const UserModel(
      {String? token,
      String? usrname,
      String? email,
      String? password,
      bool? isAdmin,
      List? fav,
      String? id});
  
  factory UserModel.fromJson(Map<String,dynamic> map){
      return UserModel(
        token: map['access_token'] ?? '',
        usrname: map['username'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        isAdmin: map['isAdmin'] ?? '',
      );
    }
}