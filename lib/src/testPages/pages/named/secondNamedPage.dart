import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutproj/src/testPages/pages/test.dart';

class secondNamedPage extends StatelessWidget {
  const secondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("secondPage"),),
      body: Center(
          child: Column(
            children: [
              RaisedButton(child: Text('뒤로 이동'),
                  onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (_) => firstPage()));
                    Get.back();
                  }),
              RaisedButton(child: Text('홈으로 이동'),
                  onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (_) => firstPage()));
                    Get.offAllNamed('/');
                  }),
            ],
          )
      ),
    );
  }
}