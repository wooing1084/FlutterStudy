import 'package:flutproj/src/testPages/contoroller/CountControllerWithGetX.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//클래스를 statelessWidget이 아니라 GetView<컨트롤러>를 상속시키면
//GetView내부의 controller변수를 사용하여 접근 할 수있다.
//Get.find해야하는 수고를 덜어준다.

//class BindingPage extends StatelessWidget {
    class BindingPage extends GetView<CountControllerWithGetX> {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('바인딩 관리 페이지'),),
      body: Column(children: [
        GetBuilder<CountControllerWithGetX>(builder: (_) {
          return Text(_.count.toString());
        }),
        ElevatedButton(onPressed: (){
          //Get.find<CountControllerWithGetX>().increase();
          controller.increase();
        },
        child: Text('+'),
        )
      ],),);
  }
}
