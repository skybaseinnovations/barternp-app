import 'dart:convert';
import 'dart:developer';

import 'package:barter_app_2023/utils/helpers/storage_helpers.dart';
import 'package:http/http.dart' as http;
import '../models/post_ads_model.dart';
import '../utils/constants/apis.dart';
import '../utils/helpers/http_requests.dart';

class PostAdsRepo {
  static Future<void> postAds({
    required PostAdsModel? postAds,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var token = StorageHelper.getAccessToken()!;
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token.tokenType} ${token.accessToken}"
      };

      var parseUrl = Uri.parse(Api.postAdsUrl);
      var body = postAds;
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
}
