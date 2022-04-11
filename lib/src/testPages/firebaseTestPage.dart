import 'package:firebase_core/firebase_core.dart';
import 'package:flutproj/src/testPages/pages/firebase/FirebaseHome.dart';
import 'package:flutproj/src/testPages/pages/test.dart';
import 'package:flutter/material.dart';

class FirebaseTestPage extends StatelessWidget {
  const FirebaseTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('firebase load fail'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return FirebaseHome();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
