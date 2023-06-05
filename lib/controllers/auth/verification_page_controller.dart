import 'dart:developer';

import 'package:barter_app_2023/Repos/auth_repo.dart';
import 'package:barter_app_2023/models/access_token.dart';
import 'package:barter_app_2023/models/user_model.dart';
import 'package:barter_app_2023/views/auth/create_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          onSuccess: (user, accessToken) {
            isLoading.value = false;
            print("================>>> user Details:  ${user.name}");
            print("================>>> accessToken details: ${accessToken.accessToken}");
            Get.toNamed(CreateProfilePage.routeName);
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
