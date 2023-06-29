import 'package:get/get.dart';

import '../../../Repos/home/ads_repo.dart';
import '../../../models/ads_model.dart';

class LikedAdsController extends GetxController with GetSingleTickerProviderStateMixin {
  RxList<AdsDetail> favouriteAds = RxList();
  var isLikeAdPageLoading = true.obs;
  @override
  void onInit() {
    fetchFeaturedAdsData();
    super.onInit();
  }

  // var searchController = TextEditingController();

  void fetchFeaturedAdsData() {
    isLikeAdPageLoading.value = true;
    AdsRepo.getFavouriteAdsDetail(onSuccess: (featuredAdsList) {
      print("get favaourteads success");
      favouriteAds.value = featuredAdsList;
      print(favouriteAds);
      isLikeAdPageLoading.value = false;
      print(isLikeAdPageLoading.value);
    }, onError: (message) {
      print("$message");
      isLikeAdPageLoading.value = false;
    });
  }
}
