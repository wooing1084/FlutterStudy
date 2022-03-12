import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/imageData.dart';
import 'controller/BottomNavController.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Obx(() => Scaffold(
          appBar: AppBar(),
          body: IndexedStack(
            index: Get.find<BottomNavController>().curIdx.value,
            children: [
              Container(child: Center(child: Text('home'),),),
              Container(child: Center(child: Text('search'),),),
              Container(child: Center(child: Text('upload'),),),
              Container(child: Center(child: Text('active'),),),
              Container(child: Center(child: Text('profile'),),),
            ],
          ),
          bottomNavigationBar:_bottomNavigationBar(),
        ),),
        //뒤로가기버튼이 눌렸을때
        onWillPop:
          Get.find<BottomNavController>().willPopAction
        );
  }

  BottomNavigationBar _bottomNavigationBar()
  {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: Get.find<BottomNavController>().curIdx.value,
      elevation: 0,
      onTap: Get.find<BottomNavController>().SetCurIdx,
      items: [
        BottomNavigationBarItem(
            icon: ImageData(IconsPath.homeOff),
            activeIcon: ImageData(IconsPath.homeOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(IconsPath.searchOff),
            activeIcon: ImageData(IconsPath.searchOn),
            label: 'search'),
        BottomNavigationBarItem(
            icon: ImageData(IconsPath.uploadIcon), label: 'upload'),
        BottomNavigationBarItem(
            icon: ImageData(IconsPath.activeOff),
            activeIcon: ImageData(IconsPath.activeOn),
            label: 'active'),
        BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              width: 45,
              height: 45,
            ),
            label: 'profile'),
      ],
    );
  }
}