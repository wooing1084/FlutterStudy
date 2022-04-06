import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutproj/src/components/avatar_widget.dart';
import 'package:flutproj/src/components/imageData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AvatarWidget(
            type: AvatarType.TYPE3,
            name: 'Guest_Name',
            size: 45,
            thumbPath:
                'https://pds.joins.com/news/component/htmlphoto_mmdata/201506/04/htm_20150604145312c010c011.jpg'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () {},
            child: ImageData(
              IconsPath.postMoreIcon,
              width: 40,
            ),
          ),
        ),
      ],
    );
  }

//이미지 컨트롤러 만듦(업로드 이미지 갯수)
  Widget _image() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.0),
      alignment: Alignment.topLeft,
      child: CachedNetworkImage(
        imageUrl:
            'https://t1.daumcdn.net/movie/0007909f71efba0cfe508d68bb479f7592367730',
        width: Get.width,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _info() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: ImageData(
                    IconsPath.likeOffIcon,
                    width: 60,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: ImageData(
                    IconsPath.replyIcon,
                    width: 60,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: ImageData(
                    IconsPath.directMessage,
                    width: 60,
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: GestureDetector(
              onTap: () {},
              child: ImageData(
                IconsPath.bookMarkOffIcon,
                width: 60,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _descript() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '좋아요 999개',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('예시 컨텐츠입니다.\n예시 컨텐츠입니다.\n예시 컨텐츠입니다.\n예시 컨텐츠입니다.')
      ],
    );
  }

  Widget _reply() {
    return Container();
  }

  Widget _dateAgo() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _header(),
          _image(),
          _info(),
          _descript(),
          // _reply(),
          // _dateAgo()
        ],
      ),
//      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black)),
    );
  }
}
