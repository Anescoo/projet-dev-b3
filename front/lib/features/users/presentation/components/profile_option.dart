import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final Function()? onPressed;
  final String option;
  final IconData icon;

  const ProfileOption({
    super.key,
    this.onPressed,
    required this.option,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
               Icon(
                icon,
                size: 72,
              ),
              Text(option)
            ],
          ),
        ));
  }
}