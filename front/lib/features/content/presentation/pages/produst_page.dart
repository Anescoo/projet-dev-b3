import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/features/content/presentation/components/filter.dart';
import 'package:front/features/content/presentation/components/product_card.dart';
import 'package:front/features/content/domain/entity/product.dart';
import 'package:front/features/content/presentation/state/product_state.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});
  // ignore: non_constant_identifier_names
  final int NUMBER_OF_COMPONENT = 8;
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Filter(),
        Expanded(
          child: Container(
              color: const Color.fromARGB(255, 233, 228, 228),
              child: Consumer<ProductState>(
                  builder: (context, productState, child) {
                    productState.getAllContent();
                return Column(
                  children: [
                    if (productState.getContent == []) ...[
                      const Center(
                        child: CupertinoActivityIndicator(),
                      ),
                      Text("1")
                    ] else if (productState.getContent != []) ...[
                      // Text("2"),
                      Expanded(
                        child: GridView.builder(
                          itemCount: productState.content.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 270,
                                  crossAxisSpacing: 6),
                          itemBuilder: (context, index) {
                            Product product = productState.content[index];
                            return ProductCard(
                              index: index + 1,
                              product: product,
                            );
                          },
                        ),
                      )
                    ]
                  ],
                );
              })),
        ),
      ],
    );
  }
}
