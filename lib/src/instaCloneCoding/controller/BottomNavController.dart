import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../MessagePopUp.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVE, PROFILE }

class BottomNavController extends GetxController {
  RxInt curIdx = 0.obs;
  List<int> navHistory = [0];

  void SetCurIdx(int idx) {
    var page = PageName.values[idx];
    switch (page) {
      case PageName.UPLOAD:
        Get.toNamed('/uploadPage');
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVE:
      case PageName.PROFILE:
        if(curIdx.value != idx)
        {
          curIdx(idx);
          int historyIter = navHistory.indexOf(idx);
          if(historyIter != -1)
          {
            if(idx == 0) {
              navHistory.clear();
            }
            else
             navHistory.removeAt(navHistory.indexOf(idx));
          }
          navHistory.add(idx);
          print(navHistory);
        }
        break;
    }
  }

  Future<bool> willPopAction() async{
    if(navHistory.length == 1){
      print('exit');
      showDialog(context: Get.context!, builder: (context) => MessagePopUp(title: '시스템',message: '종료하시겠습니까',
        cancleCallBack: Get.back,
        okCallBack: (){exit(0);},));
      return true;
    }
    else{
      print('go to before page');
      navHistory.removeLast();
      print(navHistory);
      curIdx(navHistory.last);
      return false;
    }
  }
}
