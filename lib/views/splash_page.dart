import 'package:barter_app_2023/controllers/splash_page_controller.dart';
import 'package:barter_app_2023/utils/colors.dart';
import 'package:barter_app_2023/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = "/splashPage/";
  final c = Get.find<SplashPageController>();
  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: SvgPicture.asset(ImagePath.barterLogoPath),
      ),
    );
  }
}
