import 'package:flutter/material.dart';
import 'package:front/core/app.dart';
import 'package:front/features/users/domain/usecase/connect_user.dart';
import 'package:front/features/users/presentation/pages/sign_up_ui.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';
import '../components/square_tile.dart';

class SignInUi extends StatelessWidget {
  late var getIt;
  SignInUi({Key? key, required this.getIt}) : super(key: key);

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ConnectUser connectUser = getIt.get<ConnectUser>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(92, 7, 160, 207),
                height: 120,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      connectUser(params: [
                        emailController.text,
                        passwordController.text
                      ]);
                      // Navigate to another page
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
                          ),
                        ),
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
                          ),
                        ),
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
                      const Text("Pas de compte?"),
                      const SizedBox(
                        width: 4,
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to SignUp page
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUp(
                              getIt: getIt,
                            ),
                          ));
                        },
                        child: const Text(
                          "Inscrivez vous",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
