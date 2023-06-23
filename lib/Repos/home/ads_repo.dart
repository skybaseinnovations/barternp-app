import 'dart:convert';
import 'dart:developer';
import 'package:barter_app_2023/models/ads_model.dart';
import 'package:barter_app_2023/utils/constants/apis.dart';
import 'package:http/http.dart' as http;

import '../../utils/helpers/http_requests.dart';

class AdsRepo {
  static Future<void> getFeaturedAdsDetail({
    bool isPreview = true,
    String? url,
    required Function(List<AdsDetail>, String? nextPageUrl) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var stringUrl = isPreview ? "${Api.featuredAdsUrl}?preview=1" : url ?? Api.featuredAdsUrl;

      var parseUrl = Uri.parse(stringUrl);

      print("=================>>> featured ads Url $parseUrl");

      http.Response response = await BarterRequest.get(parseUrl, headers: headers);
      dynamic data = jsonDecode(response.body);
      print(data);
      if (data["status"]) {
        List<AdsDetail> adsList;

        isPreview
            ? adsList = adsModelfromJson(data["data"])
            : adsList = adsModelfromJson(data["data"]["data"]);
        var nextPageUrl = isPreview ? null : data["data"]["next_page_url"];
        onSuccess(adsList, nextPageUrl);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log("$e");
      log("$s");
      onError("Something went wrong");
    }
  }

  static Future<void> getNearbyAdsDetail({
    bool isPreview = true,
    String? url,
    required Function(List<AdsDetail>, String? nextPageUrl) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var stringUrl = isPreview ? "${Api.nearByAdsUrl}?preview=1" : url ?? Api.nearByAdsUrl;

      var parseUrl = Uri.parse(stringUrl);

      print("=================>>> nearby ads Url $parseUrl");

      http.Response response = await BarterRequest.post(parseUrl, headers: headers);
      dynamic data = jsonDecode(response.body);

      if (data["status"]) {
        List<AdsDetail> adsList;

        isPreview
            ? adsList = adsModelfromJson(data["data"])
            : adsList = adsModelfromJson(data["data"]["data"]);
        var nextPageUrl = isPreview ? null : data["data"]["next_page_url"];

        onSuccess(adsList, nextPageUrl);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log("$e");
      log("$s");
      onError("Something went wrong");
    }
  }
}
