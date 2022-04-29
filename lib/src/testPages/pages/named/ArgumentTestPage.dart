import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArgumentTestPage extends StatelessWidget {
  const ArgumentTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Argument Test Page"),),
      body: Center(
          child: Column(
            children: [
              Text("${Get.arguments['name']} : ${Get.arguments['age']}"),
              ElevatedButton(child: Text('홈으로 이동'),
                  onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (_) => firstPage()));
                    Get.toNamed('/');
                  }),
            ],
          )
      ),
    );
  }
}
