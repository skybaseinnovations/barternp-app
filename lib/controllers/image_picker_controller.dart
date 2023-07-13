import 'dart:convert';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:barter_app_2023/widgets/custom/custom_snackbar.dart';

import '../models/media_model.dart';

class ImagePickerController extends GetxController {
  RxList images = [].obs;
  RxList<dynamic> displayImage = [].obs;
  var isEdit = false.obs;
  var isTap = false.obs;
  RxList<dynamic> editImages = <String>[].obs;
  RxList<dynamic> finalImages = <String>[].obs;
  RxList<MediaDetails> media = <MediaDetails>[].obs;

  RxList<dynamic> removedIds = <dynamic>[].obs;
  String? base64Image;
  final ImagePicker _picker = ImagePicker();

  void deleteImage(int index) {
    if (isEdit.value) {
      if (index >= 0 && index < editImages.length) {
        if (editImages[index] == media[index].originalUrl) {
          editImages.removeAt(index);
          removedIds.add(media[index].id);
        }

        // editImages.removeAt(index);
      }
    } else {
      if (index >= 0 && index < images.length) {
        images.removeAt(index);
        displayImage.removeAt(index);
      }
    }
  }

  pickImage(ImageSource source) async {
    if (images.length >= 5 || editImages.length >= 5) {
      return BarterSnackBar.error(
          message: "You can only post 5 ads per post.", title: "Photo limit reached");
    } else {
      final pickedImage = await _picker.pickImage(
        imageQuality: 70,
        source: source,
      );

      if (isEdit.value == false) {
        if (pickedImage != null) {
          displayImage.add(pickedImage.path);
          base64Image = base64Encode(await pickedImage.readAsBytes());
          images.add(base64Image);
        }
      } else {
        if (pickedImage != null) {
          editImages.add(pickedImage.path);
          base64Image = base64Encode(await pickedImage.readAsBytes());
          images.add(base64Image);
        }
      }
    }
  }
}
