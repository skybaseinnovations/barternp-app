import 'package:barter_app_2023/views/dashboard/chat_page.dart';
import 'package:barter_app_2023/views/dashboard/home_page.dart';
import 'package:barter_app_2023/views/dashboard/my_ads_page.dart';
import 'package:barter_app_2023/views/dashboard/profile_page.dart';
import 'package:get/get.dart';

class DashPageController extends GetxController {
  RxInt currentIndex = RxInt(0);
  final pages = [
    HomePage(),
    const ChatPage(),
    MyAdsPage(),
    ProfilePage(),
  ];
  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
