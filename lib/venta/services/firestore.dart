import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectofirebase3/venta/models/product_model.dart';

class FirestoreDB {
  //inicializar firebase cloud firestore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('productos')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}
