import 'package:flutter/material.dart';
import 'package:front/core/constatns.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backGround,
      height: 20,
      child: Text("filter",style: TextStyle(fontSize: 20),),
    );
  }
}