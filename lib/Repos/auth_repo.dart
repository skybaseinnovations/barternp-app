import 'dart:convert';
import 'dart:developer';

import 'package:barter_app_2023/models/access_token.dart';
import 'package:barter_app_2023/models/user_model.dart';
import 'package:barter_app_2023/utils/http_request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/api.dart';

class AuthRepo {
  static Future<void> loginUser({
    required String phoneNumber,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var body = {"phone": phoneNumber};
      var parseUrl = Uri.parse(Api.loginUrl);

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

  static Future<void> verifyUser({
    required String phoneNumber,
    required String otp,
    required Function(User, AccessToken) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var body = {"phone": phoneNumber, "otp": otp};
      var parseUrl = Uri.parse(Api.verifyUrl);

      log("=================>>> login Url $parseUrl");

      http.Response response =
          await BarterRequest.post(parseUrl, headers: headers, body: jsonEncode(body));
      dynamic data = jsonDecode(response.body);
      log(data);
      if (data["status"]) {
        User user = User.fromJson(data["data"]["user"]);
        AccessToken accessToken = AccessToken.fromJson(data["data"]["token"]);

        onSuccess(
          user,
          accessToken,
        );
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
