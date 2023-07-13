class Api {
  static const String baseUrl = "https://barter.skybase.com.np/api/v1";
  static const String loginUrl = "$baseUrl/otp-login";
  static const String verifyUrl = "$baseUrl/otp-verify";
  static const String createProfileUrl = "$baseUrl/auth/update-profile";
  static const String homeBannerUrl = "$baseUrl/banners";
  static const String categoryDetailsUrl = "$baseUrl/categories";
  static const String subCategoryUrl = "$baseUrl/categories/";
  static const String featuredAdsUrl = "$baseUrl/featured-ads";
  static const String nearByAdsUrl = "$baseUrl/nearby-ads";
  static const String adsDetailsUrl = "$baseUrl/ads";
  static const String searchAdsUrl = "$baseUrl/ads-search";
  static const String toggleFavouriteAdsUrl = "$baseUrl/auth/user-favourite";
  static const String isAddFavouriteUrl = "$baseUrl/auth/is-ad-favourite";
  static const String myFavouriteAdsUrl = "$baseUrl/auth/user-favourites";
  static const String myActiveAdsUrl = "$baseUrl/user/my-ads/active";
  static const String myInactiveAdsUrl = "$baseUrl/user/my-ads/inactive";
  static const String myExpiredAdsUrl = "$baseUrl/user/my-ads/expired";
  static const String deleteAdsUrl = "$baseUrl/auth/ads/delete";
  static const String postAdsUrl = "$baseUrl/auth/ads";
}
