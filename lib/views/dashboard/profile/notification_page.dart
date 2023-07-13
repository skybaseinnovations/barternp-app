import 'package:barter_app_2023/controllers/dashboard/profile/notification_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/views/dashboard/chat/chatting_page.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom/custom_tab_bar.dart';
import '../../../widgets/row/notification_item_tile.dart';

class NotificationPage extends StatelessWidget {
  static const String routeName = "/notificationPage/";
  final c = Get.find<NotificationPageController>();
  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
          child: Column(
            children: [
              BarterAppBar(
                hasLeading: true,
                centerTitle: true,
                title: Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              SizedBox(
                // width: Get.width * (1.7 / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => CustomTabBar(
                        animation: Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
                            .animate(c.tabAnimationController.animationController),
                        title: 'General',
                        onTap: () {
                          c.tabAnimationController.animationController.reverse();
                          c.showGeneralNotificationPage();
                        },
                        suffixWidget: Container(
                          alignment: Alignment.center,
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColor.primaryTextColor,
                              width: 1.5,
                            ),
                          ),
                          child: const Text(
                            "6",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        isActive: c.currentIndex.value == 0,
                      ),
                    ),
                    Obx(
                      () => CustomTabBar(
                        animation: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                            .animate(c.tabAnimationController.animationController),
                        title: 'Recommendations',
                        onTap: () {
                          c.tabAnimationController.animationController.forward();
                          c.showRecommendationAds();
                        },
                        suffixWidget: Container(
                          alignment: Alignment.center,
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColor.primaryTextColor,
                              width: 1.5,
                            ),
                          ),
                          child: const Text(
                            "6",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        isActive: c.currentIndex.value == 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            key: const PageStorageKey(1),
            padEnds: false,
            physics: const BouncingScrollPhysics(),
            controller: c.pageController,
            allowImplicitScrolling: true,
            onPageChanged: (int index) {
              if (index == 0) {
                c.tabAnimationController.animationController.reverse();
                c.currentIndex.value = index;
              } else {
                c.tabAnimationController.animationController.forward();
                c.currentIndex.value = index;
              }
            },
            children: [
              ListView.builder(
                  padding: const EdgeInsets.only(top: 1),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return NotificationTile(
                        showDate: true,
                        isRead: true,
                        onTap: () {
                          Get.toNamed(ChattingPage.routeName);
                        },
                      );
                    }
                    return NotificationTile(
                      onTap: () {
                        Get.toNamed(ChattingPage.routeName);
                      },
                    );
                  },
                  itemCount: 3),
              ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 1),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return NotificationTile(
                        showDate: true,
                        onTap: () {
                          Get.toNamed(ChattingPage.routeName);
                        },
                      );
                    }
                    return NotificationTile(
                      onTap: () {
                        Get.toNamed(ChattingPage.routeName);
                      },
                    );
                  },
                  itemCount: 3),
            ],
          ),
        )
      ],
    ));
  }
}
