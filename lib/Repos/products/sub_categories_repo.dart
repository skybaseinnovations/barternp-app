import 'dart:convert';
import 'dart:developer';

import '../../models/categories.dart';
import '../../utils/constants/apis.dart';
import 'package:http/http.dart' as http;

import '../../utils/helpers/http_requests.dart';

class SubCategoryRepo {
  static Future<void> fetchSubCategoryData({
    required String id,
    required Function(List<CategoryDetails> categoryDetails) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var parseUrl = Uri.parse(Api.subCategoryUrl + id);

      http.Response response = await BarterRequest.get(parseUrl);
      dynamic responseData = jsonDecode(response.body);

      if (responseData["status"]) {
        List<CategoryDetails> categoryDetails =
            categorisefromJson(responseData['data']["subcategories"]);
        print("object");
        print(categoryDetails[0].fields);
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
