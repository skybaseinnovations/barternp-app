import 'package:barter_app_2023/controllers/dashboard/dash_page_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashPage extends StatelessWidget {
  static const String routeName = "/dashPage/";
  DashPage({super.key});
  final dpc = Get.find<DashPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 4),
            borderRadius: BorderRadius.circular(40),
          ),
          child: FloatingActionButton(
            elevation: 1.3,
            // clipBehavior: Clip.antiAlias,
            backgroundColor: AppColor.primaryColor,
            onPressed: () {},
            child: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 66,
        child: Obx(() => BottomNavigationBar(
              unselectedItemColor: AppColor.tertiaryTextColor,
              selectedItemColor: AppColor.primaryColor,
              // unselectedIconTheme: const IconThemeData(color: AppColor.tertiaryTextColor),
              // selectedItemColor: ,
              // selectedIconTheme: const IconThemeData(color: AppColor.secondaryColor),
              type: BottomNavigationBarType.fixed,
              currentIndex: dpc.currentIndex.value,
              onTap: dpc.onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline_rounded),
                  label: "Chat",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.campaign_outlined),
                  label: "My ads",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  label: "Profile",
                ),
              ],
            )),
      ),
      extendBody: true,
      body: SafeArea(child: Obx(() => dpc.pages[dpc.currentIndex.value])),
    );
  }
}
