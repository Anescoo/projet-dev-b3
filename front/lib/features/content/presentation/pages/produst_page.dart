import 'package:flutter/material.dart';
import 'package:front/features/content/presentation/components/filter.dart';
import 'package:front/features/content/presentation/components/product_card.dart';
import 'package:front/features/content/domain/entity/product.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});
  // ignore: non_constant_identifier_names
  final int NUMBER_OF_COMPONENT = 8;
  // ignore: non_constant_identifier_names
  final List<Product> Lproducts = [
    const Product(
        description: 'description1',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test1',
        price: 1,
        productId: 1,
        productQuantity: 2),
    const Product(
        description: 'description2',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test2',
        price: 1,
        productId: 1,
        productQuantity: 2),
    const Product(
        description: 'description3',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test3',
        price: 1,
        productId: 1,
        productQuantity: 2),
    const Product(
        description: 'description4',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test4',
        price: 1,
        productId: 1,
        productQuantity: 2),
    const Product(
        description: 'description5',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test5',
        price: 1,
        productId: 1,
        productQuantity: 2),
    const Product(
        description: 'description6',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test6',
        price: 1,
        productId: 1,
        productQuantity: 2),
    const Product(
        description: 'description7',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test7',
        price: 1,
        productId: 1,
        productQuantity: 2),
    const Product(
        description: 'description8',
        imageUrl:
            'https://d4c5gb8slvq7w.cloudfront.net/eyJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjcwMCwiaGVpZ2h0Ijo3MDJ9fSwiYnVja2V0IjoidGhyZWFkc21hZ2F6aW5lLnMzLnRhdW50b25jbG91ZC5jb20iLCJrZXkiOiJhcHBcL3VwbG9hZHNcLzUxMzlcLzEzXC8xMTIwMTkyMlwvMTMxLXR1cm4tb2YtY2xvdGgtMDEtbWFpbi03MDB4NzAyLmpwZyJ9',
        name: 'test8',
        price: 1,
        productId: 1,
        productQuantity: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Filter(),
        Expanded(
          child: Container(
              color: const Color.fromARGB(255, 233, 228, 228),
              child: GridView.builder(
                itemCount: NUMBER_OF_COMPONENT,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 270,
                    crossAxisSpacing: 6),
                itemBuilder: (context, index) {
                  Product product = Lproducts[index];
                  return ProductCard(
                    index: index + 1,
                    product: product,
                  );
                },
              )),
        ),
      ],
    );
  }
}
