// Represent the user that is auth in the app
import 'package:equatable/equatable.dart';

class User extends Equatable {
  String? token;
  String? usrname;
  String? email;
  String? password;
  bool? isAdmin;
  List? favoriteProducts;
  String? id;

  User({
    this.token,
    this.usrname,
    this.email,
    this.password,
    this.isAdmin,
    this.favoriteProducts,
    this.id,
  });


  @override
  // implement props: set the variables used for object comparaison
  List<Object?> get props {
    return [usrname, id, email, isAdmin];
  }
}
