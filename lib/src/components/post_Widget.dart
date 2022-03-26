import 'package:flutproj/src/components/avatar_widget.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header()
  {
    return Row(
      children: [
        AvatarWidget(type: AvatarType.TYPE3,name: 'Guest_Name',size: 45,
            thumbPath: 'https://pds.joins.com/news/component/htmlphoto_mmdata/201506/04/htm_20150604145312c010c011.jpg'),
      ],
    );
  }

  Widget _image()
  {
    return Container();
  }

  Widget _info()
  {
    return Container();
  }
  Widget _descript()
  {
    return Container();
  }

  Widget _reply()
  {
    return Container();
  }

  Widget _dateAgo()
  {
    return Container();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _header(),
         // _image(),
         // _info(),
         // _descript(),
         // _reply(),
         // _dateAgo()
        ],
      ),
//      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black)),
    );
  }
}
