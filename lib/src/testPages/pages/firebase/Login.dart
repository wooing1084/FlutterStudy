import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  //구글 Auth연동을 위한 코드(flutterfire에서 가져옴)
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text('SNS Login')),
      body: Center(
          child: Column(
        children: [
          FloatingActionButton(
            onPressed: signInWithGoogle,
            child: Text('google Login'),
          ),
          FloatingActionButton(
            onPressed: signInWithGoogle,
            child: Text('kakao login'),
          )
        ],
      )),
    );
  }
}
