import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectofirebase3/venta/controllers/cart_controller.dart';
import 'package:proyectofirebase3/venta/controllers/product_controller.dart';

class CatalogProducts extends StatelessWidget {
  final productController = Get.put(ProductController());

  CatalogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
          child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (BuildContext context, int index) {
                return CatalogProductCard(index: index);
              })),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  final ProductController productController = Get.find();
  final cartController = Get.put(CartController());
  final int index;
  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            productController.products[index].nombre,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          )),
          Expanded(
              child: Text(
            '${productController.products[index].precio}',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          )),
          IconButton(
              onPressed: () {
                cartController.addProducts(productController.products[index]);
              },
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
