import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BarterErrorPage extends StatelessWidget {
  final String imagePath;
  final String? title;
  final String? subTitle;
  const BarterErrorPage({
    super.key,
    required this.imagePath,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            const SizedBox(
              height: 47,
            ),
            Text(
              title ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: AppColor.primaryTextColor,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              subTitle ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColor.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
