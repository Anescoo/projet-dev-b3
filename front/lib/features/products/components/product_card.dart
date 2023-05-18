import 'package:flutter/material.dart';
import 'package:front/features/products/product_controller.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final Function()? onTap;
  final int index;
  final String image;
  final int price;
  const ProductCard(
      {Key? key,
      required this.index,
      required this.image,
      required this.price,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: const Color.fromARGB(255, 226, 220, 220),
            child: Column(
              children: [
                Image.asset(
                  image,
                  height: 180,
                ),
                Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "$price €",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          )),
    );
  }
}

/**
 * 
 Card(
      color: Colors.black26,
      child: SizedBox(
        width: 30,
        height: 40,
        child: Column(
          children: [
            Image.asset(
              "asset/main_vad_product.png",
              height: 80,
              width: 85,
            ),
            Text(
              'Item $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "0 €",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
 */
