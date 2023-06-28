import 'package:barter_app_2023/Repos/home/ads_repo.dart';
import 'package:barter_app_2023/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAdsPageController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxList<AdsDetail> myActiveAds = RxList();
  Rx<String?> activeAdsNextPageUrl = Rx(null);
  ScrollController activePageScrollController = ScrollController();
  var isActivePageLoading = true.obs;

  RxList<AdsDetail> myInactiveAds = RxList();
  Rx<String?> inActiveAdsNextPageUrl = Rx(null);
  ScrollController inActivePageScrollController = ScrollController();
  var isInactivePageLoading = true.obs;

  RxList<AdsDetail> myExpiredAds = RxList();
  Rx<String?> expiredAdsNextPageUrl = Rx(null);
  ScrollController expiredPageScrollController = ScrollController();
  var isExpiredPageLoading = true.obs;

  @override
  void onInit() {
    tabController =
        TabController(length: 3, vsync: this, animationDuration: const Duration(milliseconds: 700));
    fetchActiveAdsData();
    fetchInactiveAdsData();
    fetchExpiredAdsData();
    activePageScrollController.addListener(() {
      if (activePageScrollController.offset >=
              activePageScrollController.position.maxScrollExtent &&
          !activePageScrollController.position.outOfRange) {
        print(" =========>>> the value of next page url is: ${activeAdsNextPageUrl.value}");
        if (activeAdsNextPageUrl.value != null) {
          fetchActiveAdsData(nextPageurl: activeAdsNextPageUrl.value);
        }
      }
    });
    inActivePageScrollController.addListener(() {
      if (inActivePageScrollController.offset >=
              inActivePageScrollController.position.maxScrollExtent &&
          !inActivePageScrollController.position.outOfRange) {
        print(" =========>>> the value of next page url is: ${inActiveAdsNextPageUrl.value}");
        if (inActiveAdsNextPageUrl.value != null) {
          fetchInactiveAdsData(nextPageurl: inActiveAdsNextPageUrl.value);
        }
      }
    });
    expiredPageScrollController.addListener(() {
      if (expiredPageScrollController.offset >=
              expiredPageScrollController.position.maxScrollExtent &&
          !expiredPageScrollController.position.outOfRange) {
        print(" =========>>> the value of next page url is: ${expiredAdsNextPageUrl.value}");
        if (expiredAdsNextPageUrl.value != null) {
          fetchExpiredAdsData(nextPageurl: expiredAdsNextPageUrl.value);
        }
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  fetchActiveAdsData({String? nextPageurl}) {
    AdsRepo.getMyActiveAdsDetail(
        url: nextPageurl,
        onSuccess: (adsList, url) {
          myActiveAds.addAll(adsList);
          activeAdsNextPageUrl.value = url;
          isActivePageLoading.value = false;
        },
        onError: (message) {
          print("===========>> $message");
        });
  }

  fetchInactiveAdsData({String? nextPageurl}) {
    AdsRepo.getMyInactiveAdsDetail(
        url: nextPageurl,
        onSuccess: (adsList, url) {
          myInactiveAds.addAll(adsList);
          inActiveAdsNextPageUrl.value = url;
          isInactivePageLoading.value = false;
        },
        onError: (message) {
          print("===========>> $message");
        });
  }

  fetchExpiredAdsData({String? nextPageurl}) {
    AdsRepo.getMyExpiredAdsDetail(
        url: nextPageurl,
        onSuccess: (adsList, url) {
          myExpiredAds.addAll(adsList);
          expiredAdsNextPageUrl.value = url;
          isExpiredPageLoading.value = false;
        },
        onError: (message) {
          print("===========>> $message");
        });
  }
}
