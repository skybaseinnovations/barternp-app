import 'dart:developer';

import 'package:barter_app_2023/models/ads_model.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

class ProductDetailPageController extends GetxController {
  var isMyAds = false.obs;

  late AdsDetail adsDetail;

  @override
  void onInit() {
    //argument will be in the form {"isMyAds": false,"adsDetail": AdsDetail.instance }
    var myAdsArgument = Get.arguments;
    adsDetail = myAdsArgument["adsDetail"];
    isMyAds.value = myAdsArgument["isMyAds"] ?? false;

    super.onInit();
  }

  var isFav = false.obs;
  HawkFabMenuController hawkFabMenuController = HawkFabMenuController();
  CarouselController buttonCarouselController = CarouselController();

  var photoIndex = 1.obs;
  var productImage = [
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
  ];
  onChatTap() {
    log("================>>>> chat field is tapped");
  }

  onCallTap() {
    log("================>>>> call field is tapped");
  }

  onFavTap() {
    isFav.value = !isFav.value;
  }

  onEditTap() {
    log("================>>>> edit field is tapped");
  }

  onDeactivateTap() {
    log("================>>>> deactivate field is tapped");
  }

  onDeletetap() {
    log("================>>>> delete field is tapped");
  }
}
