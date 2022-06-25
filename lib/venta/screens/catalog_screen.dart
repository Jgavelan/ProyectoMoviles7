import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectofirebase3/venta/screens/cart_screen.dart';
import 'package:proyectofirebase3/venta/widget/catalog_products.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: SafeArea(
        child: Column(
          children: [
            CatalogProducts(),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  shadowColor: MaterialStateProperty.all(Colors.black),
                  minimumSize: MaterialStateProperty.all(Size(100, 60))),
              onPressed: () => Get.to(() => CartScreen()),
              child: Text(
                'Registrar venta',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
