import 'package:flutter/material.dart';
import 'package:front/features/products/components/filter.dart';
import 'package:front/features/products/components/product_card.dart';
import 'package:front/features/products/components/product_details.dart';
import 'package:front/features/products/product_controller.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  const Product({super.key});
  final int NUMBER_OF_COMPONENT = 50;

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Column(
      children: [
        const Filter(),
        Expanded(
          child: Container(
              color: const Color.fromARGB(255, 240, 237, 237),
              child: GridView.builder(
                  itemCount: NUMBER_OF_COMPONENT,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 270,
                      crossAxisSpacing: 6),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      index: index,
                      image: 'asset/main_vad_product.png',
                      price: 2,
                      onTap: () {
                        print("object");
                        // productController.isDetail.value = true;
                        Navigator.of(context).push(MaterialPageRoute(
                          //! make the buttom menu stay still on details widget and on the product widget
                          builder: (context) => const Details(),
                        ));
                      },
                    );
                  })),
        ),
      ],
    );
  }
}
