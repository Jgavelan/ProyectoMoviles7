import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectofirebase3/principal_pages/add_ventas.dart';

import '../controllers/cart_controller.dart';

class CartTotal extends StatefulWidget {
  CartTotal({Key? key}) : super(key: key);

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final CartController controller = Get.find();

  //conexion con firebase
  final CollectionReference _ventas =
      FirebaseFirestore.instance.collection('ventas');

  final TextEditingController _totalController = TextEditingController();

//crear
  Future<void> _crear([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _totalController.text = documentSnapshot['total'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _totalController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      labelText: 'Registrar venta',
                      hintText: '\$${controller.total}'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final double? total =
                          double.tryParse(_totalController.text);
                      if (total != null) {
                        await _ventas.add({"total": total});
                        _totalController.text = '';
                      }
                    },
                    child: Text('Registrar'))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: _crear,
              child: Text(
                'Total',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '\$${controller.total}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
