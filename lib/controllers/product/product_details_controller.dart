import 'dart:developer';

import 'package:barter_app_2023/controllers/dashboard/my_ads_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/profile/like_ads_controller.dart';
import 'package:barter_app_2023/models/ads_model.dart';
import 'package:barter_app_2023/views/dashboard/chat/chatting_page.dart';
import 'package:barter_app_2023/widgets/custom/custom_snackbar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Repos/home/ads_repo.dart';

class ProductDetailPageController extends GetxController {
  var lac = Get.find<LikedAdsController>();
  var apc = Get.find<MyAdsPageController>();
  var isMyAds = false.obs;
  late String adId;
  Rxn<AdsDetail> adsDetail = Rxn<AdsDetail>();
  List<AdsDetail>? similarAds;
  var isLoading = true.obs;
  var isFavLoading = false.obs;
  var isFav = false.obs;
  TextEditingController commentController = TextEditingController();

  @override
  void onInit() {
    // argument will be in the form {"isMyAds": false,"adId": "id" }
    var myAdsArgument = Get.arguments;
    adId = myAdsArgument["adId"];
    isMyAds.value = myAdsArgument["isMyAds"] ?? false;
    getSingleProductDetail();
    isFavouritAd();
    super.onInit();
  }

  HawkFabMenuController hawkFabMenuController = HawkFabMenuController();
  CarouselController buttonCarouselController = CarouselController();

  var photoIndex = 1.obs;
  onChatTap() {
    log("================>>>> chat field is tapped");
    Get.toNamed(ChattingPage.routeName);
  }

  var hasSupport = false;
  onCallTap() async {
    log("================>>>> call field is tapped");

    try {
      await launchUrl(Uri(
        scheme: 'tel',
        path: adsDetail.value!.seller!.phone,
      ));
    } catch (e) {
      BarterSnackBar.error(
          title: "Cannot open dialer", message: "Your device doesnot support dialer");
    }
  }

  onFavTap() {
    isFavLoading.value = true;
    AdsRepo.toogleFavouriteAd(
        adId: adId,
        onSuccess: (isFavourite) {
          isFav.value = isFavourite;
          isFavLoading.value = false;
        },
        onError: (messages) {
          BarterSnackBar.error(title: "Toggle like", message: messages);
          isFavLoading.value = false;
        });
    try {
      lac.fetchFeaturedAdsData();
    } catch (e) {
      print("Controller is not found");
    }
  }

  isFavouritAd() {
    isFavLoading.value = true;
    AdsRepo.isFavouriteAd(
        adId: adId,
        onSuccess: (isFavourite) {
          isFav.value = isFavourite;
          isFavLoading.value = false;
        },
        onError: (messages) {
          BarterSnackBar.error(title: "Favourite ad", message: messages);
          isFavLoading.value = false;
        });
  }

  onEditTap() {
    log("================>>>> edit field is tapped");
  }

  onDeactivateTap() {
    log("================>>>> deactivate field is tapped");
  }

  onDeletetap() {
    log("================>>>> delete field is tapped");
    AdsRepo.deleteAdsDetail(
        adId: adId,
        onSuccess: (message) {
          Get.back();
          BarterSnackBar.success(title: "Delete Ad", message: message);
          apc.myActiveAds.clear();
          apc.myExpiredAds.clear();
          apc.myInactiveAds.clear();
          apc.fetchActiveAdsData();
          apc.fetchExpiredAdsData();
          apc.fetchInactiveAdsData();

          // print("hereeee ${}");
        },
        onError: (message) {
          BarterSnackBar.error(title: "Delete Ad", message: message);
        });
  }

  void getSingleProductDetail() {
    AdsRepo.getSingleAdsDetail(
      productId: adId,
      onSuccess: (adsDetails, similarAdsDetails) {
        adsDetail.value = adsDetails;
        similarAds = similarAdsDetails;

        // print(similarAdsDetails);
        isLoading.value = false;
      },
      onError: (message) {
        log("=============>>>>> getsingle ads error :::$message");
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
          BarterSnackBar.success(title: "Successfully commented");
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
        BarterSnackBar.success(title: "Successfully deleted");
        commentController.clear();
      },
      onError: (message) {
        print("$message");
        isLoading.value = false;
      },
    );
  }
}
