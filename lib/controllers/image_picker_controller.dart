import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:barter_app_2023/widgets/custom/custom_snackbar.dart';

class ImagePickerController extends GetxController {
  RxList images = [].obs;
  RxList displayImage = [].obs;
  String? base64Image;
  final ImagePicker _picker = ImagePicker();

  void deleteImage(int index) {
    if (index >= 0 && index < images.length) {
      images.removeAt(index);
    }
  }

  pickImage(ImageSource source) async {
    if (images.length >= 5) {
      return BarterSnackBar.error(
          message: "You can only post 5 ads per post.", title: "Photo limit reached");
    }

    final pickedImage = await _picker.pickImage(
      imageQuality: 100,
      source: source,
    );
    if (pickedImage != null) {
      displayImage.add(pickedImage.path);
      base64Image = base64Encode(await pickedImage.readAsBytes());
      print(base64Image);
      images.add(base64Image);
    }
  }
}
