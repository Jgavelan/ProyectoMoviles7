import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:proyectofirebase3/venta/screens/catalog_screen.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatalogScreen(),
    );
  }
}
