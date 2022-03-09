import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/imageData.dart';
import 'contoroller/BottomNavController.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final deviceData = MediaQuery.of(context);
    //final screenSize = deviceData.size;
    //final double Width = screenSize.width;
    //final double Height = screenSize.height;

    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(),
            body: Container(),
            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
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
                      activeIcon: ImageData(IconsPath.homeOn),
                      label: 'home'),
                ],
              ),
            )),
        onWillPop: () async {
          return false;
        });
  }
}