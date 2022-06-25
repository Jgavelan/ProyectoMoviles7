import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/cart_products.dart';
import '../widget/cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CartProducts(),
          Expanded(
              child: SingleChildScrollView(
            child: CartTotal(),
          ))
        ],
      ),
    );
  }
}
