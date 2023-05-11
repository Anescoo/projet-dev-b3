import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SignUp extends StatelessWidget {
  final  AuthController controller;

  const SignUp({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.yellow,
      child: Center(
          child: TextButton(
        onPressed: () {
          // for signin
            controller.isSignUp.value = false;
        },
        child: const Text('got to signin'),
      )),
    );
  }
}
