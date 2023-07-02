import 'package:flutter/material.dart';
import 'package:front/features/users/presentation/components/profile_option.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(92, 7, 160, 207),
            height: 120,
          ),
          const Text(
            "Profile",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          ProfileOption(
            icon: Icons.account_circle,
            option: 'Profile',
            onPressed: () {},
          ),
          ProfileOption(
            icon: Icons.manage_history,
            option: 'Commandes',
            onPressed: () {},
          ),
          ProfileOption(
            icon: Icons.heat_pump_rounded,
            option: 'Favorit',
            onPressed: () {},
          ),
          ProfileOption(
            icon: Icons.settings,
            option: 'Paramètre',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
