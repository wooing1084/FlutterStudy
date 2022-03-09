
import 'src/pages/Binding/BindingsCollect.dart';
import 'src/pages/named/firstNamePage.dart';
import 'src/pages/named/secondNamedPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/contoroller/BottomNavController.dart';
import 'src/contoroller/CountControllerWithGetX.dart';
import 'src/pages/Binding/BindingPage.dart';
import 'src/pages/named/ArgumentTestPage.dart';
import 'src/pages/test.dart';
import 'src/InstaMainPage.dart';

void main() {
  runApp(MyApp());
}

//메인페이지 선언
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //바인딩 또는 컨트롤러를 사용하는 페이지에서 put한 경우엔 해당 페이지를 벗어나면
    //컨트롤러 할당이 해제된다. 만약 컨트롤러의 값을 유지하려면 메인해 선언해야한다.
    //Get.put(CountControllerWithGetX());

    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black)
          )
      ),
      //home: MainPage(),
      home: Test(),
      getPages: Pages(),
      initialBinding: InitBinding(),
    );
  }
}

InitBinding() {
  Get.put(BottomNavController(),permanent: true);
}

//라우트 관리 함수
List<GetPage<dynamic>> Pages()
{
  return [
    GetPage(name: '/', page: () => Test()),
    GetPage(name: '/main',page: () => MainPage()),
    GetPage(name: '/firstPage', page: () => firstNamedPage()),
    GetPage(name: '/secondPage', page: () => secondNamedPage()),
    GetPage(name: '/argumentTestPage', page: () => ArgumentTestPage()),
    //바인딩하는 방법 1. GetPage(라우트)선언할때 바인딩해주기
    GetPage(name: '/binding', page: () => BindingPage(), binding: BindingsCollect())
  ];
}