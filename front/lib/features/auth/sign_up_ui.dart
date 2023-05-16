import 'package:flutter/material.dart';
import 'package:front/features/auth/components/my_button.dart';
import 'package:front/features/auth/components/my_text_field.dart';
import 'package:front/features/auth/components/square_tile.dart';

import 'auth_controller.dart';

//! réglé le overflow
class SignUp extends StatelessWidget {
  final AuthController authController;

  SignUp({Key? key, required this.authController}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "bienvenu dans notre boutique",
        style: TextStyle(color: Colors.grey, fontSize: 20),
      ),
      const SizedBox(
        height: 10,
      ),
      MyTextField(
        controller: usernameController,
        hinText: 'Username',
        obcureText: false,
      ),
      const SizedBox(
        height: 25,
      ),
      MyTextField(
        controller: emailController,
        hinText: 'email',
        obcureText: false,
      ),
      const SizedBox(
        height: 25,
      ),
      MyTextField(
        controller: passwordController,
        hinText: 'mot de passe',
        obcureText: true,
      ),
      const SizedBox(
        height: 25,
      ),
      MyButton(
        name: "Inscrivez vous",
        onTap: signUp(),
      ),
      const SizedBox(
        height: 25,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          children: const [
            Expanded(
                child: Divider(
              thickness: 1,
              color: Colors.grey,
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "ou continuez avec ",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
                child: Divider(
              thickness: 1,
              color: Colors.grey,
            )),
          ],
        ),
      ),
      const SizedBox(
        height: 3,
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [SquareTile(imagePath: "asset/google.png")],
        ),
      ),
      const SizedBox(
        height: 3,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Déja membre?"),
          const SizedBox(
            width: 4,
          ),
          TextButton(
            onPressed: () {
              authController.isSignUp.value = false;
            },
            child: const Text(
              "Connectez vous",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )
    ]);
  }

  signUp() {}
}
