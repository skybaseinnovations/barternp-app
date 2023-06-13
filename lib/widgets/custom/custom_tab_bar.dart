import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard/home_page_controller.dart';

class CustomTabBar extends StatelessWidget {
  final controller = Get.find<HomePageController>();
  final Animation<Offset> animation;
  final String title;
  final VoidCallback onTap;
  final bool isActive;
  CustomTabBar({
    super.key,
    required this.animation,
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        // onTap: onTap,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isActive ? AppColor.primaryTextColor : AppColor.secondaryTextColor),
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
