import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProfilePageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void onSubmit() async {
    log("=================>>> create profile page submitted");
    if (formKey.currentState!.validate()) {}
  }
}
