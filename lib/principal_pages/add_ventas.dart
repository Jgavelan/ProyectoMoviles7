import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectofirebase3/venta/controllers/cart_controller.dart';

class AddVentas extends StatefulWidget {
  AddVentas({Key? key}) : super(key: key);

  @override
  State<AddVentas> createState() => _AddVentasState();
}

class _AddVentasState extends State<AddVentas> {
  //conexion con firebase
  final CollectionReference _ventas =
      FirebaseFirestore.instance.collection('ventas');

  final TextEditingController _totalController = TextEditingController();
  //ACTUALIZAR
  Future<void> _actualizar([DocumentSnapshot? documentSnapshot]) async {
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
                  decoration: InputDecoration(labelText: 'total'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final double? total =
                          double.tryParse(_totalController.text);
                      if (total != null) {
                        await _ventas
                            .doc(documentSnapshot!.id)
                            .update({"total": total});
                        _totalController.text = '';
                      }
                    },
                    child: Text('Actualizar'))
              ],
            ),
          );
        });
  }

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
                  decoration: InputDecoration(labelText: 'total'),
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

  //eliminar
  Future<void> _eliminar(String productoId) async {
    await _ventas.doc(productoId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Se elimino la venta'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _crear(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: _ventas.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      documentSnapshot['total'].toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => _actualizar(documentSnapshot),
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                              onPressed: () => _eliminar(documentSnapshot.id),
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
