// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:proyectofirebase3/nav_page/hidden_drawer.dart';
import 'package:proyectofirebase3/principal_pages/add_products.dart';
import 'package:proyectofirebase3/principal_pages/list_products.dart';

class CloudPage extends StatelessWidget {
  const CloudPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HiddenDrawer(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
