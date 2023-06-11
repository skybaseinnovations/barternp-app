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
  late TextEditingController dateController;
  late SingleValueDropDownController genderController;
  late String initialName;
  late String initialEmail;
  late String initialPhoneNumber;
  late String initialDate;
  late String initialGender;
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
    // initialDate = cc.currentUser.value!.phone!;
    initialGender = cc.currentUser.value!.gender!;

    nameController = TextEditingController(text: initialName);
    emailController = TextEditingController(text: initialEmail);
    phoneNumberController = TextEditingController(text: initialPhoneNumber);
    dateController = TextEditingController();
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
      selectedDate.value = DateFormat('yyyy/MM/dd').format(pickedDate);
      dateController.text = selectedDate.value;
    } else {
      log("==============>>>>>>> Date is not selected");
    }
  }

  bool isTextFieldChanged() {
    if (nameController.text != initialName ||
        emailController.text != initialEmail ||
        genderController.dropDownValue!.name != initialGender) {
      return true;
    } else {
      return false;
    }
  }

  void onSubmit() async {
    log("=================>>> update profile page submitted");

    if (formKey.currentState!.validate()) {
      if (!isTextFieldChanged()) {
        BartarSnackBar.error(
            title: "Update Profile Error", message: "Please make some update to save changes.");
      } else {
        isLoading.value = true;
        AuthRepo.createProfile(
            name: nameController.text,
            gender: genderController.dropDownValue!.value,
            dob: dateController.text,
            email: emailController.text,
            onSuccess: () {
              cc.loadCurrentUser();
              Get.back();
              BartarSnackBar.success(title: "Successful");
              isLoading.value = false;
            },
            onError: (errorMessage) {
              BartarSnackBar.error(title: "Update Profile Error", message: errorMessage);
              isLoading.value = false;
            });
      }
    }
  }

  onPickImage() async {
    log("==================>>>>>pick image");
//     File? image;
// Future pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
// if(image == null) return;
// final imageTemp = File(image.path);
// setState(() => this.image = imageTemp);
//     } on PlatformException catch(e) {
//       print('Failed to pick image: $e');
//     }
//   }
    try {
      var pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        imageFile.value = File(pickedImage.path);
      }
    } catch (e) {
      log("====================>>>>>>> pick image error::: $e");
    }
  }
}
