import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutproj/src/testPages/pages/firebase/Login.dart';
import 'package:flutter/material.dart';

class FirebaseHome extends StatelessWidget {
  const FirebaseHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //사용할 스트림(파이어베이스 계정 상태)에 변화가 있으면 빌더부분을 실행함
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (!snapshot.hasData)
              return LoginWidget();
            else {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${snapshot.data?.displayName} 님 환영합니다."),
                  FlatButton(
                    onPressed: FirebaseAuth.instance.signOut,
                    child: Text('google Logout'),
                    color: Colors.grey.withOpacity(0.3),
                  )
                ],
              ));
            }
          }),
    );
  }
}
