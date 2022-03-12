import 'package:flutproj/src/testPages/contoroller/CountControllerReactive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(CountControllerReactive());

    //반응형의 경우 값이 변화가 있을때만 업데이트된다. 그러므로 여러번의 버튼 클릭이나 이벤트가 있더라도
    //해당 값에 변화가 없다면 업데이트를 하지않아 연산량이 단순형보다 적다.

    return Scaffold(
      appBar: AppBar(
        title: Text("반응형상태관리"),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text('GetX'),
                // GetX(
                //   builder: (_) {
                //     return Text('${Get.find<CountControllerReactive>().count.value}');
                //   },
                // ),
                Obx(() => Text('${Get.find<CountControllerReactive>().count.value}')),
                RaisedButton(child: Text('+'),
                    onPressed: (){
                  Get.find<CountControllerReactive>().increase();
                    })
              ]
          )
      ),
    );
  }
}
