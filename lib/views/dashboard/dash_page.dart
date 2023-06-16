import 'package:barter_app_2023/controllers/dashboard/dash_page_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/views/product/create_ads_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';

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
            onPressed: () {
              Get.toNamed(CreateAdsPage.routeName);
            },
            child: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            unselectedItemColor: AppColor.tertiaryTextColor,
            selectedItemColor: AppColor.primaryColor,
            // unselectedIconTheme: const IconThemeData(color: AppColor.tertiaryTextColor),
            // selectedItemColor: ,
            // selectedIconTheme: const IconThemeData(color: AppColor.secondaryColor),
            type: BottomNavigationBarType.fixed,
            currentIndex:
                dpc.currentIndex.value < 2 ? dpc.currentIndex.value : dpc.currentIndex.value + 1,
            onTap: dpc.onItemTapped,
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(ImagePath.activeHomeIcon),
                icon: SvgPicture.asset(ImagePath.homeIcon),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(ImagePath.activeChatIcon),
                icon: SvgPicture.asset(
                  ImagePath.chatIcon,
                ),
                label: "Chat",
              ),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                    color: Colors.transparent,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(ImagePath.activeMyAdsIcon),
                icon: SvgPicture.asset(ImagePath.myAdsIcon),
                label: "My ads",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(ImagePath.activeProfileIcon),
                icon: SvgPicture.asset(ImagePath.profileIcon),
                label: "Profile",
              ),
            ],
          )),
      extendBody: true,
      body: SafeArea(child: Obx(() => dpc.pages[dpc.currentIndex.value])),
    );
  }
}
