import 'package:flutter/material.dart';
import 'package:front/features/products/components/product_details.dart';
import 'package:front/features/products/product_controller.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final String image;
  final int price;
  const ProductCard({
    Key? key,
    required this.index,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
        // productController.isDetail.value = true;
        Navigator.of(context).push(MaterialPageRoute(
          //! make the buttom menu stay still on details widget and on the product widget
          builder: (context) => const Details(
            description: 'dqdqfqfsqs',
            image: 'asset/main_vad_product.png',
            price: 2,
          ),
        ));
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: const Color.fromARGB(255, 226, 220, 220),
            child: Column(
              children: [
                Image.network(
                  image,
                  height: 100,
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
