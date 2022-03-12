import 'package:flutproj/src/components/imageData.dart';
import 'package:flutproj/src/testPages/contoroller/CountControllerReactive.dart';
import 'package:flutproj/src/testPages/pages/Simple_State_Manage_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'Reactive_State_Manage_Page.dart';
import 'dependencys/Dependency_Manage_Page.dart';
import 'normal/firstPage.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //실제 코딩 부분
    //CupertinoApp(); - 애플스타일 테마/ 이 외에도 여러 테마가 있음
    //MaterialApp - 갤럭시 스타일 테마

    //Row나 Column등 위젯중 padding이나 margin또는 데코레이션이 안되는 위젯이 있다
    //이를 해결하기위해서는 SizedBox(컨테이너보다 기능은 적고 속도는 빠름)나 Container로 덮으면 된다.
    //Container(child: Icon(Icons.water_damage), padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),), 이런식으로
    Get.put(CountControllerReactive());

    return Scaffold(
      appBar: AppBar(title: Text('라우트 관리 홈')),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 100,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (_, __) => Container(
                child: ImageData('assets/images/plus_icon.png'),
                width: 100,
                height: 100,
                margin: EdgeInsets.all(20),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Center(
              child: Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                RaisedButton(
                    child: Text('일반적인 라우트'),
                    onPressed: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (_) => firstPage()));
                      Get.to(firstPage());
                    }),
                RaisedButton(
                    child: Text('네이밍 라우트'),
                    onPressed: () {
                      Get.toNamed('/firstPage');
                    }),
                RaisedButton(
                    child: Text('Arguments 넘기기'),
                    onPressed: () {
                      Get.toNamed('/argumentTestPage',
                          arguments: {"name": "정성훈", "age": 22});
                    }),
                RaisedButton(
                    //상태관리 하는법
                    //컨트롤러라는 이름의 클래스를 생성한다.(단순형은 GetxController를 extends해야함)
                    //이벤트 발생시 화면을 업데이트 해야하니 컨트롤러 클래스의 이벤트 함수 안에 upadte()로 화면이 업데이트 되야함을 알림
                    //컨트롤러를 사용하는 즉, 상태관리가 필요한 페이지에서 Get.Put(컨트롤러())로 선언한 후 해당 값을 받아와야함
                    //단순형의 경우  GetBuilder<CountControllerWithGetX>(builder: (controller) {이 안에 controller로 접근}
                    //이벤트 발생시키려면 Get.find(컨트롤러).함수()로 사용한다.
                    //이때 Get.find(컨트롤러)로 컨트롤러 내의 변수들을 접근할 수 있다.
                    child: Text('단순상태관리'),
                    onPressed: () {
                      Get.to(SimpleStateManagePage());
                    }),
                RaisedButton(
                  //반응형의 경우엔 FXInt와 같은 변수형으로 값에 변화가 있는지 실시간으로 확인하여 변화가 있을시 업데이트함
                  //컨트롤러라는 이름으로 클래스를 생성하고 반응형으로 확인하려는 변수를 선언(RxInt count = 0.obs;)하기만 하면 컨트롤러의 역할은 끝이다.
                  //이제 반응형으로 상태가 변경되어야하는 페이지에 Get.Put(컨트롤러())로 선언 후 Obx((){})
                  child: Text('반응형상태관리'),
                  onPressed: () {
                    Get.to(ReactiveStateManagePage());
                  },
                ),
                //컨트롤러 변수는 어느 페이지에서나 공유한다. 같은 기능으로 각각 다른 페이지에서 사용하고싶다면 id를 주어 사용해야한다.
                //또한 Get.Put을 하면 어디서 했던지간에 한번 그 코드를 실행했다면 어디서든지 접근이 가능하다.
                // Obx(() => Text('${Get.find<CountControllerReactive>().count.value}')),
                // RaisedButton(child: Text('+'),
                //     onPressed: (){
                //       Get.find<CountControllerReactive>().increase();
                //     })

                RaisedButton(
                    child: Text('의존성관리'),
                    onPressed: () {
                      Get.to(DependencyManagePage());
                    }),
                RaisedButton(
                    child: Text('바인딩'),
                    onPressed: () {
                      Get.toNamed('/binding');
                    }),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
