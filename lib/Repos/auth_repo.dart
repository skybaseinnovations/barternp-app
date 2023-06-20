import 'dart:convert';
import 'dart:developer';
import 'package:barter_app_2023/utils/constants/apis.dart';
import 'package:barter_app_2023/utils/constants/storage_keys.dart';
import 'package:barter_app_2023/utils/helpers/http_requests.dart';
import 'package:barter_app_2023/utils/helpers/storage_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

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
    required Function(dynamic) onSuccess,
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
      if (data["status"]) {
        onSuccess(data["data"]);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log("$e");
      log("$s");
      onError("Something went wrong");
    }
  }

  static Future<void> createProfile({
    String? image,
    required String name,
    required String gender,
    required String dob,
    required String email,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var token = StorageHelper.getAccessToken()!;

      // var tokens =
      //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZmI1MTcwZDgyYTQxZjEzZjZlYzk5OWZhNTdjZDRiMzI3YjQzNzI3NzQ2Mjg3YzMwNWM2Y2QyMGExYjgwMjQ2MTk3MzUyN2QzYjg4NmMxNzAiLCJpYXQiOjE2ODYwNDkyNTAuMzkwOTc5LCJuYmYiOjE2ODYwNDkyNTAuMzkwOTgxLCJleHAiOjE3MTc2NzE2NTAuMzg2Njk2LCJzdWIiOiJmYzU4ODgyNC1lMmY3LTRmODItODViOC1jYjYxNjllMzlkMDUiLCJzY29wZXMiOltdfQ.nXnd0nytayInhJLduyTA3iapUsiLVT1IT3ve5JGAWSv_PylfbJexwYTX7o3eA1MP6B5I-O8MLTE-5B79uqJIVSpuWxsZwhrsm6CVSUzv8WabZPHw01uavF6WcjJLPx44VUQ5XLyfc4K0UwsERZeSvWRoATl8R95DYssXcIi5Y_aVsAdjFpsi1KKACTPUJaU7w4opl-dMIR00Cav7n-38rfMklHgklh7deiIrmOTn9p84Nz34AsbYPBjT9kpJ3-NU_9u66NRNZH0posfvaJuvvgF5Bpe2QS7vDa8dHfkhHoOmg2HkNGJg1-rFo8wOs1jPB_DxOhCQ8J2oEkfz0dma3_Ag8sb2WDDQdjT1K1CbRpZou6dd59PfuVaGtnIytVwPXcZAZXxXkjRZhIZdUjn-lQxbzI487YV03EnYLun330xExzdknbx74q5n1yEYmG7Y5TpOe5WNEDrMYor2yD7ryC_zVxF3blo3Yq-xv_v2hI19EjbbIwGfiIDDIMTBYBLlM4vip-Gx-nZZSyagLvM1ErM7UROCrxPMEwo8lwST682GCb9f3ClHIz4GFEN4fvDGHIuKtOgH7B0NFgbROb1ankxkR6t33NfAI_M5_oEEZRRV0s6BOyyHPqjW7HZmGjjWS4etzqNiCI52w2E8tlildihuVnGYhdg7vc1tNMqBPpo";
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token.tokenType} ${token.accessToken}"
      };
      var sentImage = "data:image/png;base64,$image";
      // print(sentImage);

      // print("=======>> authorization :: ${token.tokenType} ${token.accessToken}");
      // "Authorization": "Bearer $tokens"

      var bodyWithoutImage = {"name": name, "gender": gender, "dob": dob, "email": email};
      var bodyWithImage = {
        "name": name,
        "gender": gender,
        "dob": dob,
        "email": email,
        "image": sentImage
      };

      var parseUrl = Uri.parse(Api.createProfileUrl);

      log("=================>>> login Url $parseUrl");

      http.Response response = await BarterRequest.post(parseUrl,
          headers: headers, body: jsonEncode(image == null ? bodyWithoutImage : bodyWithImage));
      dynamic data = jsonDecode(response.body);

      if (data["status"]) {
        var box = GetStorage();
        await box.write(StorageKey.user, jsonEncode(data["data"]));

        //for printing the detail of user (not needed)

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
