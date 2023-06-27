import 'dart:convert';
import 'dart:developer';
import 'package:barter_app_2023/models/ads_model.dart';
import 'package:barter_app_2023/utils/constants/apis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/helpers/http_requests.dart';
import '../../utils/helpers/storage_helpers.dart';

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

  static Future<void> getSingleAdsDetail({
    String? productId,
    required Function(AdsDetail adsDetail, List<AdsDetail> similarAdsDetail) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var stringUrl = "${Api.adsDetailsUrl}/$productId/details";

      var parseUrl = Uri.parse(stringUrl);

      print("=================>>> nearby ads Url $parseUrl");

      http.Response response = await BarterRequest.get(parseUrl, headers: headers);
      dynamic data = jsonDecode(response.body);

      if (data["status"]) {
        AdsDetail adsList = AdsDetail.fromJson(data["data"]["details"]);
        List<AdsDetail> similarAdsDetail = adsModelfromJson(data["data"]["similar"]);

        onSuccess(adsList, similarAdsDetail);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log("$e");
      log("$s");
      onError("Something went wrong");
    }
  }

  static Future<void> postComment({
    String? productId,
    required String commentText,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var token = StorageHelper.getAccessToken()!;
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token.tokenType} ${token.accessToken}"
      };
      var body = {"data": commentText};
      var stringUrl = "${Api.adsDetailsUrl}/$productId/comment";

      var parseUrl = Uri.parse(stringUrl);

      print("=================>>> nearby ads Url $parseUrl");

      log("=================>>> login Url $parseUrl");

      http.Response response =
          await BarterRequest.post(parseUrl, headers: headers, body: jsonEncode(body));

      dynamic data = jsonDecode(response.body);

      if (data["status"]) {
        onSuccess();
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log("$e");
      log("$s");
      onError("Something went wrong");
    }
  }

  static Future<void> deleteComment({
    int? commentId,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var token = StorageHelper.getAccessToken()!;
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token.tokenType} ${token.accessToken}"
      };

      var stringUrl = "${Api.adsDetailsUrl}/comments/$commentId/delete";

      var parseUrl = Uri.parse(stringUrl);

      print("=================>>> nearby ads Url $parseUrl");

      log("=================>>> login Url $parseUrl");

      http.Response response = await BarterRequest.get(parseUrl, headers: headers);

      dynamic data = jsonDecode(response.body);

      if (data["status"]) {
        onSuccess();
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log("$e");
      log("$s");
      onError("Something went wrong");
    }
  }

  static Future<void> searchAds({
    String? adsName,
    String? url,
    required Function(List<AdsDetail>, String? nextPageUrl) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var headers = {"Accept": "application/json", "Content-Type": "application/json"};
      var stringUrl = url ?? "${Api.searchAdsUrl}?query=$adsName";

      var parseUrl = Uri.parse(stringUrl);

      print("=================>>> featured ads Url $parseUrl");

      http.Response response = await BarterRequest.get(parseUrl, headers: headers);
      dynamic data = jsonDecode(response.body);
      if (data["status"]) {
        List<AdsDetail> adsList = adsModelfromJson(data["data"]["data"]);
        var nextPageUrl = data["data"]["next_page_url"];
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

  static Future<void> toogleFavouriteAd({
    String? adId,
    required Function(bool) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var token = StorageHelper.getAccessToken()!;
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token.tokenType} ${token.accessToken}"
      };

      var parseUrl = Uri.parse(Api.toggleFavouriteAdsUrl);

      print("=================>>> nearby ads Url $parseUrl");

      log("=================>>> login Url $parseUrl");
      var body = {"id": adId};

      http.Response response =
          await BarterRequest.post(parseUrl, headers: headers, body: jsonEncode(body));

      dynamic data = jsonDecode(response.body);
      if (data["status"]) {
        onSuccess(data["data"]["is_favourite"]);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log("$e");
      log("$s");
      onError("Something went wrong");
    }
  }

  static Future<void> isFavouriteAd({
    String? adId,
    required Function(bool) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var token = StorageHelper.getAccessToken()!;
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token.tokenType} ${token.accessToken}"
      };

      var parseUrl = Uri.parse(Api.isAddFavouriteUrl);

      print("=================>>> nearby ads Url $parseUrl");

      log("=================>>> login Url $parseUrl");
      var body = {"id": adId};

      http.Response response =
          await BarterRequest.post(parseUrl, headers: headers, body: jsonEncode(body));

      dynamic data = jsonDecode(response.body);
      if (data["status"]) {
        onSuccess(data["data"]["is_favourite"]);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log("$e");
      log("$s");
      onError("Something went wrong");
    }
  }

  static Future<void> getFavouriteAdsDetail({
    required Function(
      List<AdsDetail>,
    ) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var token = StorageHelper.getAccessToken()!;
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token.tokenType} ${token.accessToken}"
      };

      var parseUrl = Uri.parse(Api.myFavouriteAds);

      print("=================>>> nearby ads Url $parseUrl");

      http.Response response = await BarterRequest.get(parseUrl, headers: headers);
      dynamic data = jsonDecode(response.body);

      if (data["status"]) {
        List<AdsDetail> adsList = adsModelfromJson(data["data"]["favourite"]);
        onSuccess(adsList);
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
