import 'package:flutter/material.dart';
import 'package:front/features/products/components/filter.dart';
import 'package:front/features/products/components/product_card.dart';
import 'package:front/features/products/components/product_details.dart';
import 'package:front/features/products/product_controller.dart';
import 'package:front/features/products/product_model.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  Product({super.key});
  // ignore: non_constant_identifier_names
  final int NUMBER_OF_COMPONENT = 50;
  // ignore: non_constant_identifier_names
  List<ProductModel> Lproducts = [
    ProductModel(
        "test1",
        "description",
        "https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9",
        1,
        2),
        ProductModel(
        "test2",
        "description",
        "https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9",
        1,
        2),
        ProductModel(
        "test3",
        "description",
        "https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9",
        1,
        2),
        ProductModel(
        "test4",
        "description",
        "https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9",
        1,
        2),
        ProductModel(
        "test5",
        "description",
        "https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9",
        1,
        2),
        ProductModel(
        "test6",
        "description",
        "https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9",
        1,
        2),
        ProductModel(
        "test7",
        "description",
        "https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9",
        1,
        2),
        ProductModel(
        "test8",
        "description",
        "https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9",
        1,
        2),
  ];

  List<ProductCard> Lcards = List.generate(8, (index) => ProductCard(
                      index: index,
                      image: 'asset/main_vad_product.png',
                      price: 2,
                    ));
  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Column(
      children: [
        const Filter(),
        Expanded(
          child: Container(
              color: Color.fromARGB(255, 233, 228, 228),
              child: GridView.builder(
                  itemCount: NUMBER_OF_COMPONENT,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 270,
                      crossAxisSpacing: 6),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      index: index,
                      image: 'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
                      price: 2,
                    );
                  })),
        ),
      ],
    );
  }
}
