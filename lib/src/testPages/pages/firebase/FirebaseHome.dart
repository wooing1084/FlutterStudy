import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutproj/src/testPages/pages/firebase/Login.dart';
import 'package:flutter/material.dart';

class FirebaseHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> usersStream = FirebaseFirestore.instance
        .collection('firestoretest')
        .doc('doc1')
        .snapshots();

    return Scaffold(
      //사용할 스트림(파이어베이스 계정 상태)에 변화가 있으면 빌더부분을 실행함
      appBar: AppBar(
        title: Text('firebaseTestMain'),
      ),
      body: Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "${FirebaseAuth.instance.currentUser?.displayName} 님 환영합니다."), //snapshot인자로 접근하여 연동된 계정의 이름을 가져옴
          ElevatedButton(
            onPressed: FirebaseAuth.instance.signOut,
            child: Text('Logout')
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: usersStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Text('value is ${snapshot.data!.data()}');
              }),
          ElevatedButton(onPressed: () {}, child: Text('firestore test')),
        ],
      ))),
    );
  }
}
