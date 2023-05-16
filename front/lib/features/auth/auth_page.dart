// ignore: implementation_imports
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:front/features/auth/auth_controller.dart';
import 'package:get/get.dart';
import 'sign_up_ui.dart';
import 'sign_in_ui.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final AuthController controller = Get.put(AuthController());

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(92, 7, 160, 207),
            height: 170,
          ),
          Expanded(child: decideSignWidget(controller))
        ],
      ),
    );
  }

Widget decideSignWidget(AuthController c) {
  return Obx(() {
    if (c.isSignUp.value == true) {
      return SignUp(
        authController: c,
      );
    } else {
      return SignIn(
        authController: c,
      );
    }
  });
}

}
