import 'package:barter_app_2023/controllers/dashboard/tab_bar_controller.dart';
import 'package:barter_app_2023/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({super.key, Key});
  final c = Get.find<TabBarController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            c.showOnContainer();
            // Handle 'Featured' tab tapped
          },
          child: const Text(
            "Featured",
            style: TextStyle(
              fontSize: 16,
              color: AppColor.primaryTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            c.showOffContainer();
            // Handle 'Nearby Ads' tab tapped
          },
          child: const Text(
            "Nearby Ads",
            style: TextStyle(
              fontSize: 16,
              color: AppColor.secondaryTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
