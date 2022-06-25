import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  //firebase conexion
  final CollectionReference _productos =
      FirebaseFirestore.instance.collection('productos');

  //Actualizar

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();

  Future<void> _actualizar([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nombreController.text = documentSnapshot['nombre'];
      _precioController.text = documentSnapshot['precio'].toString();
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
                  controller: _nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _precioController,
                  decoration: const InputDecoration(labelText: 'Precio'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Actualizar'),
                  onPressed: () async {
                    final String nombre = _nombreController.text;
                    final double? precio =
                        double.tryParse(_precioController.text);
                    if (precio != null) {
                      await _productos
                          .doc(documentSnapshot!.id)
                          .update({"nombre": nombre, "precio": precio});
                      _nombreController.text = '';
                      _precioController.text = '';
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  //crear
  Future<void> _crear([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nombreController.text = documentSnapshot['nombre'];
      _precioController.text = documentSnapshot['precio'].toString();
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
                  controller: _nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _precioController,
                  decoration: const InputDecoration(labelText: 'Precio'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Registrar'),
                  onPressed: () async {
                    final String nombre = _nombreController.text;
                    final double? precio =
                        double.tryParse(_precioController.text);
                    if (precio != null) {
                      await _productos
                          .add({"nombre": nombre, "precio": precio});
                      _nombreController.text = '';
                      _precioController.text = '';
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _eliminar(String productoId) async {
    await _productos.doc(productoId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Se elimino el producto'),
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
        stream: _productos.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      dense: true,
                      tileColor: Colors.grey[200],
                      title: Text(
                        documentSnapshot['nombre'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      subtitle: Text(
                        documentSnapshot['precio'].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () => _actualizar(documentSnapshot),
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () => _eliminar(documentSnapshot.id),
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ));
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
