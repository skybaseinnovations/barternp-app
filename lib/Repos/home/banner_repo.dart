import 'dart:convert';
import 'dart:developer';

import 'package:barter_app_2023/models/banner_image_model.dart';
import 'package:barter_app_2023/utils/helpers/http_requests.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants/apis.dart';

class BannerRepo {
  static Future<void> fetchData({
    required Function(List<BannerImage> banners) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var parseUrl = Uri.parse(Api.homeBannerUrl);
      http.Response response = await BarterRequest.get(parseUrl);
      dynamic responseData = jsonDecode(response.body);
      if (responseData["status"]) {
        List<BannerImage> banners = bannersFromJson(responseData['data']);
        onSuccess(banners);
      } else {
        onError(responseData["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry sonething went wrong");
    }
  }
}
