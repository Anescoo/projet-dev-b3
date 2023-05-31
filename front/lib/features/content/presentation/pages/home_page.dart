import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/constatns.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:const  [
       Text(
          "happy  shopping",
        ),
        //TODO MAKE A FUTURE LISTVIEW OF THE 10 BESTS PRODUCTS ( products that get a log of likes )
      ],
    );
  }
}
