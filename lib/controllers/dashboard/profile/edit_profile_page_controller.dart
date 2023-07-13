import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:barter_app_2023/Repos/auth_repo.dart';
import 'package:barter_app_2023/controllers/core_controller.dart';
import 'package:barter_app_2023/widgets/custom/custom_snackbar.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfilePageController extends GetxController {
  CoreController cc = Get.find<CoreController>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController dateOfBirthController;
  late SingleValueDropDownController genderController;
  late String initialName;
  late String initialEmail;
  late String initialPhoneNumber;
  late String initialDateOfBirth;
  late String initialGender;
  late String initialImageUrl;
  String? base64Image;
  FocusNode dropdownFieldFocusNode = FocusNode();
  var hasFocus = false.obs;
  var clearOption = false.obs;
  var isLoading = false.obs;

  var formKey = GlobalKey<FormState>();
  var selectedDate = "".obs;
  final ImagePicker picker = ImagePicker();
  Rxn<File> imageFile = Rxn();

  @override
  onInit() {
    dropdownFieldFocusNode.addListener(() {
      if (dropdownFieldFocusNode.hasFocus) {
        hasFocus.value = true;
      } else {
        hasFocus.value = false;
      }
    });
    initialName = cc.currentUser.value!.name!;
    initialEmail = cc.currentUser.value!.email!;
    initialPhoneNumber = cc.currentUser.value!.phone!;
    initialDateOfBirth = cc.currentUser.value!.dob!;
    initialGender = cc.currentUser.value!.gender!;
    initialImageUrl = cc.currentUser.value!.avatarUrl!;

    nameController = TextEditingController(text: initialName);
    emailController = TextEditingController(text: initialEmail);
    phoneNumberController = TextEditingController(text: initialPhoneNumber);
    dateOfBirthController = TextEditingController(text: initialDateOfBirth);
    genderController = SingleValueDropDownController(
        data: DropDownValueModel(name: initialGender, value: initialGender));

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
      dateOfBirthController.text = selectedDate.value;
    } else {
      log("==============>>>>>>> Date is not selected");
    }
  }

  bool isTextFieldChanged() {
    if (nameController.text != initialName ||
        emailController.text != initialEmail ||
        genderController.dropDownValue!.name != initialGender ||
        dateOfBirthController.text != initialDateOfBirth ||
        imageFile.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void onSubmit() async {
    log("=================>>> update profile page submitted");

    // imageFile.value

    if (formKey.currentState!.validate()) {
      if (!isTextFieldChanged()) {
        BarterSnackBar.error(
            title: "Update Profile Error", message: "Please make some update to save changes.");
      } else {
        isLoading.value = true;
        AuthRepo.createProfile(
            image: base64Image,
            name: nameController.text,
            gender: genderController.dropDownValue!.value,
            dob: dateOfBirthController.text,
            email: emailController.text,
            onSuccess: () {
              cc.loadCurrentUser();
              Get.back();
              BarterSnackBar.success(title: "Successful");
              isLoading.value = false;
            },
            onError: (errorMessage) {
              BarterSnackBar.error(title: "Update Profile Error", message: errorMessage);
              isLoading.value = false;
            });
      }
    }
  }

  onPickImage(ImageSource source) async {
    log("==================>>>>>pick image");

    try {
      var pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        imageFile.value = File(pickedImage.path);
        base64Image = base64Encode(await imageFile.value!.readAsBytes());
      }
    } catch (e) {
      log("====================>>>>>>> pick image error::: $e");
    }
  }

  showImagePicker(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
              height: 125,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15), topRight: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        onPickImage(ImageSource.camera);
                      },
                      child: const Row(
                        children: [Icon(Icons.camera_alt_outlined), Text("Take a photo")],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        onPickImage(ImageSource.gallery);
                      },
                      child: const Row(
                        children: [Icon(Icons.image_outlined), Text("Add from gallery")],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
