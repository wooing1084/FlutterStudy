import 'package:get/get.dart';

enum PageName{
  HOME, SEARCH, UPLOAD, ACTIVE, PROFILE
}

class BottomNavController extends GetxController
{
  RxInt curIdx = 0.obs;

  void SetCurIdx(int idx)
  {
    var page = PageName.values[idx];
    switch(page)
    {
      case PageName.HOME:
        // TODO: Handle this case.
        break;
      case PageName.SEARCH:
        // TODO: Handle this case.
        break;
      case PageName.UPLOAD:
        // TODO: Handle this case.
        break;
      case PageName.ACTIVE:
        // TODO: Handle this case.
        break;
      case PageName.PROFILE:
        // TODO: Handle this case.
        break;
    }
    curIdx(idx);
  }
}