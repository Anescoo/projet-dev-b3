// Represent the user that is auth in the app
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? token;
  final  String? usrname;
  final String? email;
  final String? password;
  final bool? isAdmin;
  final List? favoriteProducts;
  final String? id;

  const User({
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
