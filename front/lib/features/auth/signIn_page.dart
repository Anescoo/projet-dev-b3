import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SignIn extends StatelessWidget {
  final AuthController controller;

  const SignIn({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
          child: TextButton(
        onPressed: () {
          //for signUp
          controller.isSignUp.value = true;
        },
        child: const Text('got to signup'),
      )),
    );
  }
}
