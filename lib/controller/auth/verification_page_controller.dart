import 'dart:developer';

import 'package:barter_app_2023/views/auth/create_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPageController extends GetxController {
  TextEditingController verificationNumberController = TextEditingController();
  void onSubmit() {
    log("=================>>> verification page submitted");
    Get.toNamed(CreateProfilePage.routeName);
  }

  void onResend() {
    log("=================>>> resend");
  }
}
