import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(143, 237, 234, 234)),
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(143, 237, 234, 234)),
      child: Image.asset(
        imagePath,
        height: 50,
      ),
    );
  }
}
