import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopUp extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? okCallBack;
  final Function()? cancleCallBack;
  const MessagePopUp({
    Key? key,
    required this.title,
    required this.message,
    required this.okCallBack,
    required this.cancleCallBack
  }) : super(key: key);

  //종료시 등장하는 팝업창
  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.transparent,
    child:Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      ClipRRect(borderRadius: BorderRadius.circular(5),
        child: Container(color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          width: Get.width * 0.7,
          child: Column(children: [
          Text(title!, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),),
          Text(message!, style: TextStyle(fontSize: 14, color: Colors.black),),
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(onPressed: okCallBack, child: Text('확인')),
              SizedBox(width: 10,),
              ElevatedButton(onPressed: cancleCallBack, child: Text('취소'), style: ElevatedButton.styleFrom(
                primary: Colors.grey
              )),
            ],)
        ],),),
      )
    ],));
  }
}
