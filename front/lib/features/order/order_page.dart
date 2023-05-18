import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow,);
  }
}

/**
 * 
 Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.white,
            gap: 3,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.window,
                text: 'Produits',
              ),
              GButton(
                icon: Icons.shopping_bag_rounded,
                text: 'Orders',
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Profile',
              )
            ],
            iconSize: 20,
            padding: EdgeInsets.all(20),
          ),
        ),
      
 */