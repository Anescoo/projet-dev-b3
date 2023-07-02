import 'package:flutter/material.dart';
import 'package:front/core/constatns.dart';
import 'package:front/features/content/domain/entity/product.dart';

class Details extends StatelessWidget {
  final Product product;

  const Details({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGround,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.imageUrl,
              height: 100,
            ),
            Text(
              product.description,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "${product.price} €",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(onPressed: () {}, child: Text('add to cardt'))
          ],
        ),
      ),
    );
  }
}
