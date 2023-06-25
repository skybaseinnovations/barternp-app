import 'dart:developer';

import 'package:barter_app_2023/models/ads_model.dart';
import 'package:barter_app_2023/widgets/custom/custom_snackbar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

import '../../Repos/home/ads_repo.dart';

class ProductDetailPageController extends GetxController {
  var isMyAds = false.obs;
  late String adId;
  Rxn<AdsDetail> adsDetail = Rxn();
  List<AdsDetail>? similarAds;
  var isLoading = true.obs;
  TextEditingController commentController = TextEditingController();

  @override
  void onInit() {
    // argument will be in the form {"isMyAds": false,"adId": "id" }
    var myAdsArgument = Get.arguments;
    adId = myAdsArgument["adId"];
    isMyAds.value = myAdsArgument["isMyAds"] ?? false;
    print(myAdsArgument);
    getSingleProductDetail();
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

  void getSingleProductDetail() {
    AdsRepo.getSingleAdsDetail(
      productId: adId,
      onSuccess: (adsDetails, similarAdsDetails) {
        adsDetail.value = adsDetails;
        similarAds = similarAdsDetails;

        print(adsDetails);
        // print(similarAdsDetails);
        isLoading.value = false;
      },
      onError: (message) {
        print("$message");
        isLoading.value = false;
      },
    );
  }

  onComment() {
    AdsRepo.postComment(
        productId: adId,
        commentText: commentController.text,
        onSuccess: () {
          getSingleProductDetail();
          BartarSnackBar.success(title: "Successfully commented");
          commentController.clear();
        },
        onError: (message) {
          print("$message");
          isLoading.value = false;
        });
  }

  onDeleteComment(int commentId) {
    AdsRepo.deleteComment(
      commentId: commentId,
      onSuccess: () {
        getSingleProductDetail();
        BartarSnackBar.success(title: "Successfully deleted");
        commentController.clear();
      },
      onError: (message) {
        print("$message");
        isLoading.value = false;
      },
    );
  }
}
