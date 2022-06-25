import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignOut extends StatefulWidget {
  SignOut({Key? key}) : super(key: key);

  @override
  State<SignOut> createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hasta Luego!',
              style: GoogleFonts.bebasNeue(fontSize: 80, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Nos vemos despues',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              user.email!,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 70,
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepPurple[200],
              child: Text('Cerrar sesion'),
            )
          ],
        ),
      ),
    );
  }
}
