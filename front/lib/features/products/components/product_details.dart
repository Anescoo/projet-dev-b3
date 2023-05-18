import 'package:flutter/material.dart';
import 'package:front/constatns.dart';

class Details extends StatelessWidget {
  final String image;

  final int price;

  final String description;

  const Details({
    Key? key,
    required this.image,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGround,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 500,
              width: 900,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "$price €",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(onPressed: () {}, child: Text('add to cardt'))
          ],
        ),
      ),
    );
  }
}
