import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Repos/home/ads_repo.dart';
import '../../../models/ads_model.dart';

class ViewAllPageController extends GetxController {
  ScrollController scrollController = ScrollController();
  var title = "".obs;
  var isViewFeaturedAds = false.obs;
  var pageName = "";
  // RxnString? nextPageUrl = RxnString();
  Rx<String?> nextPageUrl = Rx(null);
  var isLoading = true.obs;

  RxList<AdsDetail> adsDetail = RxList();

  @override
  void onInit() {
    //Argument is in the format {"pageName": "Featured_Ads" or "NearBy_Ads"});
    var viewAllArgument = Get.arguments;
    pageName = viewAllArgument["pageName"];
    if (pageName == "Featured_Ads") {
      title.value = "Featured Ads";
      fetchMoreFeaturedAdsData();
    } else {
      title.value = "Nearby Ads";
      fetchMoreNearByAdsData();
    }

    scrollController.addListener(() {
      if (scrollController.offset >= scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        print(" =========>>> the value of next page url is: ${nextPageUrl.value}");
        if (nextPageUrl.value != null) {
          if (pageName == "Featured_Ads") {
            fetchMoreFeaturedAdsData();
          } else {
            fetchMoreNearByAdsData();
          }
        }
      }
    });
    super.onInit();
  }

  void fetchMoreFeaturedAdsData() {
    AdsRepo.getFeaturedAdsDetail(
      isPreview: false,
      url: nextPageUrl.value,
      onSuccess: (featuredAdsList, nextpageUrl) {
        print("==========>> fetch featured ads data success");
        adsDetail.addAll(featuredAdsList);
        // adsDetail.value = featuredAdsList;
        nextPageUrl.value = nextpageUrl;
        print(adsDetail);
        isLoading.value = false;
      },
      onError: (message) {
        print("$message");
        isLoading.value = false;
      },
    );
  }

  void fetchMoreNearByAdsData() {
    AdsRepo.getNearbyAdsDetail(
        isPreview: false,
        url: nextPageUrl.value,
        onSuccess: (nearByAdsList, nextpageUrl) {
          print("==========>> fetch nearby ads data success");
          adsDetail.addAll(nearByAdsList);
          // adsDetail.value = nearByAdsList;
          nextPageUrl.value = nextpageUrl;
          print(adsDetail);
          isLoading.value = false;
        },
        onError: (message) {
          print("$message");
          isLoading.value = false;
        });
  }
}
