import 'package:flutter/material.dart';
import 'package:front/core/app_state.dart';
import 'package:front/features/content/presentation/state/product_state.dart';
import 'package:front/features/users/presentation/pages/sign_in_ui.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart';
void main() async {
  await initializeDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt.get<AppState>()),// the Appstate instance is available in all the app thks to Provider
        ChangeNotifierProvider(create: (context) => getIt.get<ProductState>())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(background: Colors.grey),
      ),
      home: SignInUi(getIt: getIt,),
      // home: const MyHomePage(title: 'Flutter Shop App'),
    );
  }
}
