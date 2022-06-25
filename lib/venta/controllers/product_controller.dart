import 'package:get/get.dart';
import 'package:proyectofirebase3/venta/models/product_model.dart';
import 'package:proyectofirebase3/venta/services/firestore.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}
