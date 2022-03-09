import 'package:get/get.dart';

// class exClass
// {
//   String name;
//   int age;
// }

class CountControllerReactive extends GetxController
{
  RxInt count = 0.obs;  //int 형 count를 반응형으로 사용할때 선언 방법
  //Rx<exClass> user = exClass().obs;
  //RxList list = [].obs;

  void increase(){
    count++;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}