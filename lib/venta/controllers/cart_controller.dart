import 'package:get/get.dart';
import 'package:proyectofirebase3/venta/models/product_model.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProducts(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar("Producto Agregado", "Agregaste ${product.nombre}",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 800));
  }

  //remover productos
  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  //obtener productos
  get products => _products;

  //calcular subtotal

  get productSubtotal => _products.entries
      .map((product) => product.key.precio * product.value)
      .toList();

  //calcular total

  get total => _products.entries
      .map((product) => product.key.precio * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
