import 'package:flutter/material.dart';
import 'package:front/app.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';
import 'auth_controller.dart';
import 'components/my_button.dart';
import 'components/my_text_field.dart';
import 'components/square_tile.dart';

class SignIn extends StatefulWidget {
  final AuthController authController;

  const SignIn({Key? key, required this.authController}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const App(),
          ));
        },
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
              widget.authController.isSignUp.value = true;
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
}
