import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetProduct extends StatelessWidget {
  final String documentId;

  GetProduct({required this.documentId});

  @override
  Widget build(BuildContext context) {
    //obtener colleccion
    CollectionReference users =
        FirebaseFirestore.instance.collection('productos');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '${data['Producto']}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        '${data['Precio']}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Text('Cargando...');
        }));
  }
}
