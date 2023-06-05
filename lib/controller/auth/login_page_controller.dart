import 'dart:developer';

import 'package:barter_app_2023/views/auth/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController phoneFieldController = TextEditingController();
  void onSubmit() {
    log("=================>>> login page submitted");
    Get.toNamed(VerificationPage.routeName);
  }
}
