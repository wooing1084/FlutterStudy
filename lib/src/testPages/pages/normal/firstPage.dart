import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'secondPage.dart';

class firstPage extends StatelessWidget {
  const firstPage({Key? key}) : super(key: key);

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
                    Get.to(secondPage());
                  }),
            ],
          )
      ),
    );
  }
}
