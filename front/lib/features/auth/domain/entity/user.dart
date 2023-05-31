// ignore_for_file: public_member_api_docs, sort_constructors_first
// abstraction of the user that is auth in the app
// this class define the data passed to the post object for the api
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? token;
  final String? usrname;
  final String? email;
  final String? password;
  final bool? isAdmin;
  final List? fav;
  final String? id;

  const User({
    this.token,
    this.usrname,
    this.email,
    this.password,
    this.isAdmin,
    this.fav,
    this.id,
  });

  @override
  // implement props: set the variables used for object comparaison
  List<Object?> get props {
    return [usrname, id, fav, email, isAdmin];
  }
}
