import 'package:flutter/material.dart';
import 'package:front/features/users/domain/usecase/create_user.dart';
import 'package:front/features/users/presentation/components/my_button.dart';
import 'package:front/features/users/presentation/components/my_text_field.dart';
import 'package:front/features/users/presentation/components/square_tile.dart';
import 'package:front/features/users/presentation/pages/sign_in_ui.dart';

import '../../../../core/app.dart';

//! réglé le overflow
class SignUp extends StatelessWidget {
  late var getIt;
  SignUp({Key? key, required this.getIt}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CreateUser createUser = getIt<CreateUser>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(92, 7, 160, 207),
                height: 120,
              ),
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
                onTap: () {
                  createUser(params: [
                    emailController.text,
                    passwordController.text,
                    usernameController.text,
                    "false"
                  ]);//! I don't have a admin dashbord so i register all users as not-admin for know
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const App(),
                  ));
                },
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
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
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SquareTile(imagePath: "asset/google.png")],
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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInUi(
                          getIt: getIt,
                        ),
                      ));
                    },
                    child: const Text(
                      "Connectez vous",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
