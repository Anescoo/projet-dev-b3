import 'package:flutter/material.dart';
import 'package:front/features/order/components/order_card.dart';
import 'package:front/features/order/order_controller.dart';
import 'package:get/get.dart';

import '../products/product_controller.dart';

class Order extends StatefulWidget {
  final OrderController controller;

  const Order({super.key, required this.controller});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(children: [
        Container(
          color: const Color.fromARGB(255, 68, 228, 32),
          height: 60,
        ),
        ListView.builder(
          itemCount: widget.controller.getCardLength(),
          itemBuilder: (context, index) {
            return OrderCard(
              index: index + 1,
              orderController: widget.controller,
            );
          },
        )
      ]),
    );
  }
}
