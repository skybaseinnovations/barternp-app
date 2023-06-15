import 'package:barter_app_2023/controllers/animation/line_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPageController extends GetxController {
  SlideAnimation tabAnimationController = SlideAnimation();
  var currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value, keepPage: true);
    tabAnimationController.initialize();
  }

  @override
  void dispose() {
    tabAnimationController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void showFeaturedPage() {
    pageController.animateToPage(0,
        duration: const Duration(milliseconds: 700), curve: Curves.ease);
    currentIndex.value = 0;
  }

  void showNearbyAds() {
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 700), curve: Curves.ease);
    currentIndex.value = 1;
  }
}
