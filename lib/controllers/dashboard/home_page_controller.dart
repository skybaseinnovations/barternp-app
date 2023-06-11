import 'package:barter_app_2023/controllers/animation/line_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabAnimationController.initialize();
  }

  SlideAnimation tabAnimationController = SlideAnimation();
  final pageController = PageController(initialPage: 0).obs;

  List<String> featuredImageUrl = [
    "https://th.bing.com/th/id/R.755b3ccf4906b01fec7886eed3b1c9b0?rik=MUh7BlXmTwbSEA&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/R.97ef7b3cd27c058c2837b13fb659c87a?rik=eEJttuEl9%2fY13w&pid=ImgRaw&r=0"
  ];

  List<String> nearbyAdsImageUrl = [
    "https://th.bing.com/th/id/R.97ef7b3cd27c058c2837b13fb659c87a?rik=eEJttuEl9%2fY13w&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/R.755b3ccf4906b01fec7886eed3b1c9b0?rik=MUh7BlXmTwbSEA&pid=ImgRaw&r=0",
  ];

  List<String> bannerImageUrl = [
    "https://img-9gag-fun.9cache.com/photo/am5jqv9_700bwp.webp",
    "https://i.pinimg.com/564x/d9/0d/24/d90d2433af38e9cac61b70055389c30b.jpg",
    "https://i.pinimg.com/564x/1a/b1/8d/1ab18d99dc62232a647fd8fb5d190fd7.jpg",
  ];

  final currentIndex = 0.obs;
  final isFeaturedSelected = true.obs;
  final isNearbyAdsSelected = false.obs;

  void showFeaturedPage() {
    isFeaturedSelected.value = true;
    isNearbyAdsSelected.value = false;
    pageController.value
        .animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.ease);
    currentIndex.value = 0;
  }

  void showNearbyAds() {
    isNearbyAdsSelected.value = true;
    isFeaturedSelected.value = false;
    pageController.value
        .animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.ease);
    currentIndex.value = 1;
  }

  final RxInt activeTabIndex = RxInt(0);

  void toggleActiveState(int index) {
    activeTabIndex.value = index;
  }
}
