import 'dart:convert';

import 'package:barter_app_2023/models/access_token_model.dart';
import 'package:barter_app_2023/models/user_model.dart';
import 'package:barter_app_2023/utils/storage_keys.dart';
import 'package:get_storage/get_storage.dart';

class StorageHelper {
  static AccessToken? getAccessToken() {
    try {
      final box = GetStorage();
      AccessToken token = AccessToken.fromJson(jsonDecode(box.read(StorageKey.accessToken)) ?? "");
      return token;
    } catch (e) {
      return null;
    }
  }

  static User? getUser() {
    try {
      final box = GetStorage();

      User user = User.fromJson(jsonDecode(box.read(StorageKey.user)));
      return user;
    } catch (e) {
      return null;
    }
  }
}
