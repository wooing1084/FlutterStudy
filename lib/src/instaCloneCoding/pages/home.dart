import 'package:flutproj/src/components/avatar_widget.dart';
import 'package:flutproj/src/components/imageData.dart';
import 'package:flutproj/src/components/post_Widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    //위젯을 겹쳐놓으려면 stack을 사용
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.TYPE2,
          thumbPath:
              'https://pds.joins.com/news/component/htmlphoto_mmdata/201506/04/htm_20150604145312c010c011.jpg',
        ),
        Positioned(bottom: 0, right: 5, child: Container(
          width: 25,height: 25,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue, border: Border.all(color:Colors.white,width: 2)),
          child: const Center(child: Text('+', style: TextStyle(fontSize: 20, color: Colors.white,height: 1.1),),),
        ))
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          // ...이란 리스트 배열을 나열하겠다. 앞의 요소와 연결시키는 의미
          children: [
            const SizedBox(
              width: 10,
            ),
            _myStory(),
            ...List.generate(
                100,
                (index) => AvatarWidget(
                    type: AvatarType.TYPE1,
                    thumbPath:
                        'https://pds.joins.com/news/component/htmlphoto_mmdata/201506/04/htm_20150604145312c010c011.jpg')),
          ]),
    );
  }

  Widget _postList()
  {
    return Column(
      children: List.generate(20, (index) => PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ImageData(
            IconsPath.logo,
            width: 270,
          ),
          elevation: 1,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ImageData(
                  IconsPath.directMessage,
                  width: 50,
                ),
              ),
            )
          ]),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
  }
}
