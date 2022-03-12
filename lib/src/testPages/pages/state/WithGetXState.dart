import 'package:flutproj/src/testPages/contoroller/CountControllerWithGetX.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithGetXState extends StatelessWidget {
  const WithGetXState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('GetX'),
          GetBuilder<CountControllerWithGetX>(builder: (controller) {
            return Text("${controller.count}");
          }),
          RaisedButton(child: Text('+'),
              onPressed: (){
            Get.find<CountControllerWithGetX>().increase();
          })
        ],
      ),
    );
  }
}
