import 'package:flutproj/src/testPages/contoroller/countControllerWithProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WithProviderState extends StatelessWidget {
  const WithProviderState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('provider'),
          Consumer<CountControllerWithProvider>(
            builder: (_, counter, child){
              return Text('${counter.count}');
            }
          ),
          RaisedButton(child: Text('+'),
              onPressed: (){
                Provider.of<CountControllerWithProvider>(context,listen: false).increase();
              })
        ],
      ),
    );
  }
}
