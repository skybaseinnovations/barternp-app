import 'package:barter_app_2023/views/dashboard/chat/chat_page.dart';
import 'package:barter_app_2023/views/dashboard/home/home_page.dart';
import 'package:barter_app_2023/views/dashboard/myAd/my_ads_page.dart';
import 'package:barter_app_2023/views/dashboard/profile/profile_page.dart';
import 'package:get/get.dart';

class DashPageController extends GetxController {
  RxInt currentIndex = RxInt(0);
  final pages = [
    HomePage(),
    ChatPage(),
    MyAdsPage(),
    ProfilePage(),
  ];
  void onItemTapped(int index) {
    //   currentIndex.value = index;
    if (index <= 1) {
      currentIndex.value = index;
    } else if (index >= 3) {
      currentIndex.value = index - 1;
    } else {}
  }
}
