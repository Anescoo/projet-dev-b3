// Represent the user that is auth in the app
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token;
  final String usrname;
  final String email;
  final String password;
  final bool isAdmin;
  final String id;

  const User(
      {required this.id,
      required this.token,
      required this.usrname,
      required this.email,
      required this.password,
      required this.isAdmin,
      });

  @override
  // implement props: set the variables used for object comparaison
  List<Object?> get props {
    return [usrname, id, email, isAdmin];
  }
}
