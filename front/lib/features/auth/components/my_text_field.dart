import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final  controller;
  final String hinText;
  final bool obcureText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hinText,
      required this.obcureText});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obcureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38)),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 126, 206, 128))),
            fillColor: const  Color.fromARGB(255, 216, 208, 208),
            filled: true,
            hintText: hinText),
      ),
    );
  }
}
