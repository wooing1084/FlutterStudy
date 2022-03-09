import 'package:get/get.dart';

import '../../contoroller/CountControllerWithGetX.dart';

//바인딩을 분리해놓는방법
class BindingsCollect implements Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CountControllerWithGetX());
  }

}