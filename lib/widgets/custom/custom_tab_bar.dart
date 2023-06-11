import 'package:barter_app_2023/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard/home_page_controller.dart';

class CustomTabBar extends StatelessWidget {
  final controller = Get.find<HomePageController>();
  final Animation<Offset> animation;
  final String title;
  final VoidCallback onTap;
  final bool? isActive;
  final int tabIndex;
  CustomTabBar({
    super.key,
    required this.animation,
    required this.title,
    required this.onTap,
    this.isActive,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap();
          controller.toggleActiveState(tabIndex);
        },
        // onTap: onTap,
        child: Column(
          children: [
            Obx(
              () => Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: controller.activeTabIndex.value == tabIndex
                        ? AppColor.primaryTextColor
                        : AppColor.secondaryTextColor),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SlideTransition(
              position: animation,
              child: Container(
                height: 2,
                color: AppColor.primaryTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
