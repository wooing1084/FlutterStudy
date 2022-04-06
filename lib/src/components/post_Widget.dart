import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
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
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text('좋아요 999개', style: TextStyle(fontWeight: FontWeight.bold)),
        ExpandableText(
          '예시 컨텐츠입니다.\n예시 컨텐츠입니다.\n예시 컨텐츠입니다.\n예시 컨텐츠입니다.', //N개의 줄 텍스트
          prefixText: '정성훈', //댓글의 이름부분(앞부분 고정)
          prefixStyle: TextStyle(fontWeight: FontWeight.bold), //앞부분 고정 텍스트 스타일
          onPrefixTap: () {}, //이름부분 선택시 하이퍼링크
          expandText: '더보기', //더보기 텍스트
          collapseText: '닫기', //닫기 텍스트
          expandOnTextTap: true, //더보기 하이퍼링크 주변 클릭
          collapseOnTextTap: true, //닫기 하이퍼링크 주변 클릭
          maxLines: 3, //더보기 표시 전 최대 줄 수
          linkColor: Colors.black, //링크 색상
        )
      ],
    );
  }

  Widget _reply() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        '댓글 199개 모두 보기',
        style: TextStyle(color: Colors.grey, fontSize: 13),
      ),
    );
  }

  Widget _dateAgo() {
    return Text(
      '1일전',
      style: TextStyle(color: Colors.grey, fontSize: 13),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          _image(),
          _info(),
          _descript(),
          _reply(),
          _dateAgo()
        ],
      ),
    );
  }
}
