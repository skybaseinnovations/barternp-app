import 'package:barter_app_2023/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Repos/home/ads_repo.dart';

class SearchAdsController extends GetxController {
  ScrollController scrollController = ScrollController();
  late TextEditingController searchController;
  late String adsName;
  RxList<AdsDetail> searchedAds = RxList();
  var isSearchedAdsLoading = true.obs;
  Rx<String?> nextPageUrl = Rx(null);
  @override
  void onInit() {
    // argument data is in the form {"adsName": adsName}
    var argumentData = Get.arguments;
    if (argumentData != null && argumentData is Map<String, dynamic>) {
      adsName = argumentData["adsName"];
    } else {
      return null;
    }

    searchController = TextEditingController(text: adsName);
    fetchSearchAdsData();
    scrollController.addListener(() {
      if (scrollController.offset >= scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        print(" =========>>> the value of next page url is: ${nextPageUrl.value}");
        if (nextPageUrl.value != null) {
          fetchSearchAdsData();
        }
      }
    });
    super.onInit();
  }

  void fetchSearchAdsData() {
    AdsRepo.searchAds(
        adsName: searchController.text,
        onSuccess: (nearByAdsList, nextpageUrl) {
          print("search ads success");
          searchedAds.addAll(nearByAdsList);
          nextPageUrl.value = nextpageUrl;
          print(searchedAds);
          print(nextPageUrl);
          isSearchedAdsLoading.value = false;
        },
        onError: (message) {
          print("$message");
          isSearchedAdsLoading.value = false;
        });
  }
}
