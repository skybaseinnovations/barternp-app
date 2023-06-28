import 'package:get/get.dart';

import '../../../Repos/home/ads_repo.dart';
import '../../../models/ads_model.dart';

class LikedAdsController extends GetxController with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    fetchFeaturedAdsData();
    super.onInit();
  }

  // var searchController = TextEditingController();

  RxList<AdsDetail> favouriteAds = RxList();
  var isLikeAdPageLoading = false.obs;

  void fetchFeaturedAdsData() {
    AdsRepo.getFavouriteAdsDetail(onSuccess: (featuredAdsList) {
      print("get favaourteads success");
      favouriteAds.value = featuredAdsList;
      print(favouriteAds);
      isLikeAdPageLoading.value = false;
    }, onError: (message) {
      print("$message");
      isLikeAdPageLoading.value = false;
    });
  }
}
