import 'dart:convert';
import 'dart:developer';

import 'package:barter_app_2023/utils/helpers/http_requests.dart';

import 'package:http/http.dart' as http;
import '../../models/categories.dart';
import '../../utils/constants/apis.dart';

class CategoryRepo {
  static Future<void> fetchCategoryData({
    required Function(List<CategoryDetails> categoryDetails) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var parseUrl = Uri.parse(Api.categoryDetailsUrl);
      http.Response response = await BarterRequest.get(parseUrl);
      dynamic responseData = jsonDecode(response.body);
      if (responseData["status"]) {
        List<CategoryDetails> categoryDetails = categorisefromJson(responseData['data']);
        onSuccess(categoryDetails);
      } else {
        onError(responseData["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
