import 'dart:async';
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

  //for circular progress field
  var isLoading = false.obs;
  var isResendLoading = false.obs;
  //for argumented phone number
  String? phoneNumber;
  dynamic argumentData;

  //for resend timer
  var timerDuration = 180.obs;
  Timer? resendCountdownTimer;
  var resetTime = 0.obs;
  // Duration resendDuration = const Duration(seconds: 2 * 60);
  @override
  void onInit() {
    startTimer(timerDuration.value);
    argumentData = Get.arguments;
    phoneNumber = argumentData;
    super.onInit();
  }

  void startTimer(int time) {
    resendCountdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (time < 0) {
        resendCountdownTimer!.cancel();
      } else {
        resetTime.value = time--;
        // print(resetTime);
      }
    });
  }

  var formKey = GlobalKey<FormState>();

  void onSubmit() {
    BuildContext focusContext = Get.context!;
    FocusScope.of(focusContext).unfocus();
    log("=================>>> verification page submitted");
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      AuthRepo.verifyUser(
          phoneNumber: phoneNumber!,
          otp: verificationNumberController.text,
          onSuccess: (data) async {
            print(data);
            isLoading.value = false;
            var box = GetStorage();
            if (data["is_profile_completed"]) {
              log("================>>> profile is completed(already user)");
              await box.write(StorageKey.accessToken, jsonEncode(data["token"]));
              await box.write(StorageKey.user, jsonEncode(data["user"]));

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
    log("=================>>> resend clicked");
    isResendLoading.value = true;
    AuthRepo.loginUser(
        phoneNumber: phoneNumber!,
        // phoneNumber: "1234567890",
        onSuccess: () {
          isResendLoading.value = false;
          BartarSnackBar.success(
              title: "Resend successful",
              message: "An One Time Password (OTP) is sent to your phone number");
          startTimer(timerDuration.value);
        },
        onError: (value) {
          isResendLoading.value = false;
          BartarSnackBar.error(title: "Resend Error", message: value);
        });
  }
}
