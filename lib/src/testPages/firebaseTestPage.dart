import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutproj/src/testPages/pages/firebase/FirebaseHome.dart';
import 'package:flutproj/src/testPages/pages/firebase/Login.dart';
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
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                if (!snapshot
                    .hasData) //snapshot의 값이 있는지 확인, 없을시 연동된 계정이 없는것이므로 로그인 위젯으로 전환
                  return LoginWidget();
                else {
                  return FirebaseHome();
                }
              });
        }
        return CircularProgressIndicator();
      },
    );
  }
}
