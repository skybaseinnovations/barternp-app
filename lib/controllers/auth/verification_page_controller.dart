import 'dart:convert';
import 'dart:developer';

import 'package:barter_app_2023/Repos/auth_repo.dart';
import 'package:barter_app_2023/models/access_token.dart';
import 'package:barter_app_2023/models/user_model.dart';
import 'package:barter_app_2023/utils/storage_keys.dart';

import 'package:barter_app_2023/views/auth/create_profile_page.dart';
import 'package:barter_app_2023/views/dashboard/dash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../widgets/custom/custom_snackbar.dart';

class VerificationPageController extends GetxController {
  TextEditingController verificationNumberController = TextEditingController();
  var isLoading = false.obs;
  String? phoneNumber;
  dynamic argumentData;
  @override
  void onInit() {
    argumentData = Get.arguments;
    phoneNumber = argumentData;
    super.onInit();
  }

  var formKey = GlobalKey<FormState>();
  void onSubmit() {
    log("=================>>> verification page submitted");
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      AuthRepo.verifyUser(
          phoneNumber: phoneNumber!,
          otp: verificationNumberController.text,
          onSuccess: (data) async {
            isLoading.value = false;
            var box = GetStorage();
            if (data["is_profile_completed"]) {
              log("================>>> profile is completed(already user)");
              await box.write(StorageKey.accessToken, jsonEncode(data["token"]));
              await box.write(StorageKey.user, data["user"]);

              //for printing the detail of acess token and user (not needed)
              User user = User.fromJson(data["user"]);
              AccessToken accessToken = AccessToken.fromJson(data["token"]);
              log("================>>> user Details:  ${user.name}");
              log("================>>> accessToken details: ${accessToken.accessToken}");

              //get to dashpage if user is prsent
              Get.toNamed(DashPage.routeName);
            } else {
              log("================>>> profile is completed(already user)");
              await box.write(StorageKey.accessToken, jsonEncode(data["token"]));

              //for printing the detail of acess token (not needed)
              AccessToken accessToken = AccessToken.fromJson(data["token"]);
              log("================>>> accessToken details: ${accessToken.accessToken}");
              //get to createprofilepage if user isnot prsent
              Get.toNamed(CreateProfilePage.routeName);
            }
          },
          onError: (value) {
            BartarSnackBar.error(title: "Verification Error", message: value);
            isLoading.value = false;
          });
    }
  }

  void onResend() {
    log("=================>>> resend");
  }
}
