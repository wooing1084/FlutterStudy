import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//아바타(프로필) 종류가 여러가지임
enum AvatarType { TYPE1, TYPE2, TYPE3}

class AvatarWidget extends StatelessWidget {
  bool? hasStory;
  String thumbPath;
  String? name;
  AvatarType type;
  double? size;

  AvatarWidget({Key? key,
    required this.type,
    required this.thumbPath,
    this.name,
    this.hasStory,
    this.size = 65
  }) : super(key: key);

  Widget type1Widget()
  {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight, end: Alignment.bottomLeft,
              colors: [Colors.purple, Colors.orange]),
      shape: BoxShape.circle,
      ),
      width: size,height: size, margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(2),
      //cahedNetworkImage는 인터넷상의 다운로드 가능한 이미지 url을 이용하여 이미지를 출력시키는것을 말한다.
      //이 기능을 사용하기 위해선 터미널에 add를 해주어야한다
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: ClipRRect(borderRadius: BorderRadius.circular(size!),
            child: CachedNetworkImage(imageUrl: thumbPath,fit: BoxFit.cover,)
          )
      ),
    );
  }

  Widget type2Widget()
  {
    return Container(
      width: size, height: size,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: ClipRRect(borderRadius: BorderRadius.circular(size!),
            child: CachedNetworkImage(imageUrl: thumbPath,fit: BoxFit.cover,)
        )
    );
  }

  Widget type3Widget()
  {
    return Row(
      children: [type1Widget(),
      Text(name??'', style: TextStyle(color: Colors.black, fontSize: 20),)],
    );
  }
  @override
  Widget build(BuildContext context) {
    switch(type)
    {
      case AvatarType.TYPE1:
        return type1Widget();
      case AvatarType.TYPE2:
        return type2Widget();
        case AvatarType.TYPE3:
          return type3Widget();
        break;
    }

    return Container();
  }
}
