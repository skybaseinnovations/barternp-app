import 'package:barter_app_2023/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Repos/home/ads_repo.dart';

class SearchAdsController extends GetxController {
  late TextEditingController searchController;
  String adsName = "";
  RxList<AdsDetail> searchedAds = RxList();
  var isSearchedAdsLoading = true.obs;
  @override
  void onInit() {
    // argument data is in the form {"adsName": adsName}
    var argumentData = Get.arguments;
    adsName = argumentData["adsName"];
    searchController = TextEditingController(text: adsName);
    fetchSearchAdsData();
    super.onInit();
  }

  void fetchSearchAdsData() {
    AdsRepo.searchAds(
        adsName: searchController.text,
        onSuccess: (nearByAdsList, nextPageUrl) {
          print("search ads success");
          searchedAds.value = nearByAdsList;
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
