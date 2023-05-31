import 'package:flutter/material.dart';
import 'package:front/core/app.dart';
import 'package:front/client.dart';
import 'package:front/features/users/domain/usecase/authenticate.dart';
import 'package:front/features/users/presentation/pages/sign_up_ui.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';
import '../components/square_tile.dart';
import '../../data/model/signin.dart';

class SignInUi extends StatefulWidget {
  const SignInUi({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInUi> createState() => _SignInUiState();
}

class _SignInUiState extends State<SignInUi> {
  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  Client api = Client();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(92, 7, 160, 207),
              height: 120,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  // AuthenticateUsecase login = AuthenticateUsecase();
                  // SignIn user =
                  //     SignIn(email: "testoy@gmail.com", password: "testoy64");
                  // api.signIn(user);
                  // api.pingServer();
                  // print("ui");
                  // api.pingServer().then((value) => print(value));
                  // api.request();
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
                  const Text("Pas de compte?"),
                  const SizedBox(
                    width: 4,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUp(),
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
            ]),
          ],
        ),
      ),
    );
  }
}


/**

   
 */