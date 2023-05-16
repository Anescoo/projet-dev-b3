import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'components/my_button.dart';
import 'components/my_text_field.dart';
import 'components/square_tile.dart';

class SignIn extends StatelessWidget {
  final AuthController authController;

  SignIn({Key? key, required this.authController}) : super(key: key);

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Connectez vous",
        style: TextStyle(color: Colors.grey, fontSize: 20),
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
        name: "Connectez vous",
        onTap: signIp(),
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
              authController.isSignUp.value = true;
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
  
  signIp() {}
}
