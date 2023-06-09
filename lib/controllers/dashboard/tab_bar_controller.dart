import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController {
  final pageController = PageController(initialPage: 0).obs;
  final currentIndex = 0.obs;

  void showOnContainer() {
    pageController.value
        .animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.ease);
    currentIndex.value = 0;
  }

  void showOffContainer() {
    pageController.value
        .animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.ease);
    currentIndex.value = 1;
  }
}
