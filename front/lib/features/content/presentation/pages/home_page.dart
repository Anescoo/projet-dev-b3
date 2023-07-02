import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children:[
       Text(
          "happy  shopping",
        ),
        //TODO MAKE A FUTURE LISTVIEW OF THE 10 BESTS PRODUCTS ( products that get a log of likes )
      ],
    );
  }
}
