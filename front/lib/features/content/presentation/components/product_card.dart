import 'package:flutter/material.dart';
import 'package:front/features/content/domain/entity/product.dart';
import 'package:front/features/content/presentation/components/product_details.dart';


class ProductCard extends StatelessWidget {
  final int index;
  final Product product;
  const ProductCard({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
        // productController.isDetail.value = true;
        Navigator.of(context).push(MaterialPageRoute(
          //! make the buttom menu stay still on details widget and on the product widget
          builder: (context) => Details(
            product: product,
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
                  product.imageUrl,
                  height: 100,
                ),
                Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "${product.price} €",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          )),
    );
  }
}