import 'package:flutproj/src/testPages/contoroller/Dependency_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetLazyPut extends StatelessWidget {
  const GetLazyPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LazyPut'),
      ),
      body: RaisedButton(
        onPressed: () {
          Get.find<DependencyController>().increase();
        },
      ),
    );
  }
}
