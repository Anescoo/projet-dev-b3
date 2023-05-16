import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SignIn extends StatelessWidget {
  final AuthController authController;

  const SignIn({Key? key, required this.authController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
          child: TextButton(
        onPressed: () {
          //for signUp
          authController.isSignUp.value = true;
        },
        child: const Text('got to signup'),
      )),
    );
  }
}
