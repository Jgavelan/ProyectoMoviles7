import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String nombre;
  final double precio;

  const Product({
    required this.nombre,
    this.precio = 0,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(nombre: snap['nombre'], precio: snap['precio']);
    return product;
  }

  //static const List<Product> products = [
  //Product(nombre: 'manzana', precio: 2.5),
  //Product(nombre: 'banana', precio: 1),
  //Product(nombre: 'pera', precio: 3.6)
  //];
}
