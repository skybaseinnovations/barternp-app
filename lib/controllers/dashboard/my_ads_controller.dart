import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAdsPageController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController =
        TabController(length: 3, vsync: this, animationDuration: const Duration(milliseconds: 700));
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
