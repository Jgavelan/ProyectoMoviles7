import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:proyectofirebase3/principal_pages/add_products.dart';
import 'package:proyectofirebase3/principal_pages/list_products.dart';
import 'package:proyectofirebase3/principal_pages/signout_page.dart';
import 'package:proyectofirebase3/principal_pages/add_ventas.dart';

class HiddenDrawer extends StatefulWidget {
  HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'AGREGAR PRODUCTOS',
              baseStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              selectedStyle: TextStyle()),
          AddProducts()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'VER PRODUCTOS',
              baseStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              selectedStyle: TextStyle()),
          ListProducts()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: Colors.deepPurple,
              name: 'VENTAS',
              baseStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              selectedStyle: TextStyle()),
          AddVentas()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: Colors.deepPurple,
              name: 'CERRAR SESION',
              baseStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              selectedStyle: TextStyle()),
          SignOut()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.deepPurple.shade300,
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 60,
      contentCornerRadius: 100,
    );
  }
}
