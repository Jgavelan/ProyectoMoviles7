import 'package:flutter/material.dart';
import 'package:proyectofirebase3/pages/login_page.dart';

import '../pages/register_page.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initially, show the login page

  bool showLoginPage = true;

  void togleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login_Page(showRegisterPage: togleScreens);
    } else {
      return RegisterPage(showLoginPage: togleScreens);
    }
  }
}
