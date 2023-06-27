class Api {
  static const String baseUrl = "http://192.168.100.24:8000/api/v1";
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
  static const String myFavouriteAds = "$baseUrl/auth/user-favourites";
}
