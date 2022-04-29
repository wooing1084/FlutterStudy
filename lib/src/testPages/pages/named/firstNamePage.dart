import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'secondNamedPage.dart';

class firstNamedPage extends StatelessWidget {
  const firstNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("firstPage"),),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(child: Text('다음페이지 이동'),
                  onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (_) => firstPage()));
                    Get.toNamed('/secondPage');
                  }),
            ],
          )
      ),
    );
  }
}