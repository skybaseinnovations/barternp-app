import 'dart:developer';

import 'package:barter_app_2023/Repos/auth_repo.dart';
import 'package:barter_app_2023/views/auth/verification_page.dart';
import 'package:barter_app_2023/widgets/custom/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController phoneFieldController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  void onSubmit() {
    log("=================>>> login page submitted");

    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      AuthRepo.loginUser(
          phoneNumber: phoneFieldController.text,
          onSuccess: () {
            isLoading.value = false;
            log("login Success");
            Get.toNamed(VerificationPage.routeName, arguments: phoneFieldController.text);
          },
          onError: (value) {
            isLoading.value = false;
            BarterSnackBar.error(title: "Login Error", message: value);
          });
    }
  }
}
