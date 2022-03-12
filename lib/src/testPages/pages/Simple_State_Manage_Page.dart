import 'package:flutproj/src/testPages/contoroller/CountControllerWithGetX.dart';
import 'package:flutproj/src/testPages/contoroller/countControllerWithProvider.dart';
import 'package:flutproj/src/testPages/pages/state/WithGetXState.dart';
import 'package:flutproj/src/testPages/pages/state/WithProviderState.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithGetX());
    return Scaffold(
      appBar: AppBar(title: Text("단순상태관리"),),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Expanded(child: WithGetXState(
             )),
              Expanded(child: ChangeNotifierProvider<CountControllerWithProvider>(create: (_) => CountControllerWithProvider(),
                  child: WithProviderState(),

              ),)
            ],
          )
      ),
    );
  }
}
