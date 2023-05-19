import 'package:flutter/material.dart';
import 'package:front/features/order/order_controller.dart';

class OrderCard extends StatelessWidget {
  final int? index;
  final OrderController orderController;
  const OrderCard(
      {super.key,
      this.index,
      required this.orderController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    );
  }
}
