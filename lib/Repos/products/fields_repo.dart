import 'dart:convert';
import 'dart:developer';

import 'package:barter_app_2023/models/fields_model.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants/apis.dart';
import '../../utils/helpers/http_requests.dart';

class FieldsRepo {
  static Future<void> fetchFieldsData({
    required String id,
    required Function(List<FieldDetails> fieldDetails) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var parseUrl = Uri.parse(Api.subCategoryUrl + id);
      http.Response response = await BarterRequest.get(parseUrl);
      dynamic responseData = jsonDecode(response.body);
      if (responseData["status"]) {
        List<FieldDetails> fieldDetails = fieldsFromJson(responseData['data']["subcategories"]);
        onSuccess(fieldDetails);
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
