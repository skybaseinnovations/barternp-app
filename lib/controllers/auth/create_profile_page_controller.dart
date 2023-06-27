import 'dart:developer';

import 'package:barter_app_2023/Repos/auth_repo.dart';
import 'package:barter_app_2023/controllers/core_controller.dart';

import 'package:barter_app_2023/views/dashboard/dash_page.dart';
import 'package:barter_app_2023/widgets/custom/custom_snackbar.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateProfilePageController extends GetxController {
  CoreController cc = Get.find<CoreController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  SingleValueDropDownController genderController = SingleValueDropDownController(
      data: const DropDownValueModel(name: "Unspecified", value: "Unspecified"));
  FocusNode dropdownFieldFocusNode = FocusNode();
  var hasFocus = false.obs;
  var clearOption = false.obs;
  var isLoading = false.obs;

  var formKey = GlobalKey<FormState>();
  var selectedDate = "".obs;

  @override
  onInit() {
    dropdownFieldFocusNode.addListener(() {
      if (dropdownFieldFocusNode.hasFocus) {
        hasFocus.value = true;
      } else {
        hasFocus.value = false;
      }
    });
    super.onInit();
  }

  selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 13),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year - 13),
    );

    if (pickedDate != null) {
      log("===============>>>>$pickedDate");
      selectedDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateController.text = selectedDate.value;
    } else {
      log("==============>>>>>>> Date is not selected");
    }
  }

  void onSubmit() async {
    log("=================>>> create profile page submitted");
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      AuthRepo.createProfile(
          name: nameController.text,
          gender: genderController.dropDownValue!.value,
          dob: dateController.text,
          email: emailController.text,
          onSuccess: () {
            cc.loadCurrentUser();
            BarterSnackBar.success(title: "Successful");
            Get.offAllNamed(DashPage.routeName);
            isLoading.value = false;
          },
          onError: (errorMessage) {
            BarterSnackBar.error(title: "Create Profile Error", message: errorMessage);
            isLoading.value = false;
          });
    }
  }

  void onTermsAndConditionSubmit() async {
    log("=================>>> terms and condition submitted");
  }
}
