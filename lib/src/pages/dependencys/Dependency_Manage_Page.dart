import 'package:flutproj/src/contoroller/Dependency_Controller.dart';
import 'package:flutproj/src/pages/dependencys/Get_LazyPut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Get_Put.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의존성주입'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text('GetPut'),
                onPressed: () {
                  //"기본적인 put방식"
                  //Get.to함수 인자중에 binding은 해당 페이지와 컨트롤러를 결합시키는 역할을 한다.
                  //페이지가 닫힐때는 바인딩된 컨트롤러도 같이 삭제되어 메모리 소모를 줄일 수 있다.
                  Get.to(GetPut(), binding: BindingsBuilder(() {
                    Get.put(DependencyController());
                  }));
                }),
            RaisedButton(
                child: Text('Get.lazyPut'),
                //'LazyPut'
                //컨트롤러의 인스턴스가 사용될때 바인딩된 컨트롤러가 생성된다.
                onPressed: () {
                  Get.to(GetLazyPut(), binding: BindingsBuilder(() {
                    Get.lazyPut(() => DependencyController());
                  }));
                }),
            RaisedButton(
                child: Text('Get.putAsync'),
                onPressed: () {
                  Get.to(GetPut(), binding: BindingsBuilder(() {
                    Get.putAsync<DependencyController>(() async {
                      await Future.delayed(Duration(seconds: 5));
                      return DependencyController();
                    });
                  }));
                }),
            // RaisedButton(
            //     child: Text('Get.Create'),
            //     //'Get.Create'
            //     //지금까지 컨트롤러들은 인스턴스가 하나만 생성되어 공유하는것이었지만
            //     // Create는 인스턴스를 사용할때마다 매번 새로 인스턴스를 생성한다.
            //     onPressed: () {
            //       Get.to(GetPut(), binding: BindingsBuilder(() {
            //         Get.create<DependencyController>(() => DependencyController());
            //       }));
            //     }),
          ],
        ),
      ),
    );
  }
}
