import 'dart:convert';
import 'dart:developer';

import 'package:barter_app_2023/Repos/post_ads_repo.dart';
import 'package:barter_app_2023/controllers/dashboard/my_ads_controller.dart';
import 'package:barter_app_2023/controllers/image_picker_controller.dart';
import 'package:barter_app_2023/views/dashboard/myAd/my_ads_page.dart';
import 'package:barter_app_2023/views/product/create_ads_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../Repos/products/categories_repo.dart';
import '../../Repos/products/sub_categories_repo.dart';
import 'package:barter_app_2023/widgets/custom/custom_snackbar.dart';
import '../../models/ads_model.dart';
import '../../models/categories.dart';
import '../../models/fields_model.dart';
import '../../models/post_ads_model.dart';

class CreateAdsController extends GetxController {
  final currentStep = 0.obs;
  var isLoading = true.obs;
  final ipc = Get.put(ImagePickerController());
  TextEditingController titleFieldController = TextEditingController();
  TextEditingController descriptionFieldController = TextEditingController();
  TextEditingController priceFieldController = TextEditingController();
  TextEditingController categoryFieldController = TextEditingController();
  TextEditingController subCategoryFieldController = TextEditingController();
  final c = Get.put(MyAdsPageController());
  Rxn<AdsDetail> adsDetail = Rxn<AdsDetail>();
  var formKey = GlobalKey<FormState>();
  var fieldsFormKey = GlobalKey<FormState>();
  RxList<CategoryDetails> categoryDetails = RxList();

  var isCategoryLoading = true.obs;
  var isCategoryEmpty = false.obs;

  late List<Step> steps;
  @override
  void onInit() {
    var data = Get.arguments;

    if (data != null) {
      adsDetail.value = data;
      onEditTapped();
    }
    categoryData();
    super.onInit();
  }

  onSubmit() {
    if (formKey.currentState?.validate() ?? true) {
      subCategoryFieldController.text = catSubTitle.value!.title!;
      categoryFieldController.text = catTitle.value;
      return true;
    }
  }

  onNext() {
    if (fieldsFormKey.currentState!.validate()) {
      return true;
    }
  }

  Future<void> onEditTapped() async {
    Get.toNamed(CreateAdsPage.routeName);
    titleFieldController.text = adsDetail.value!.title!;
    descriptionFieldController.text = adsDetail.value!.description!;
    priceFieldController.text = (adsDetail.value!.price!).toString();
    // priceFieldController.text = adsDetail.value!.price! as String;
    categoryFieldController.text = adsDetail.value!.adCategory!.title!;
    catId.value = adsDetail.value!.categoryId!;
    catTitle.value = adsDetail.value!.adCategory!.title!;
    if (adsDetail.value!.subcategory != null) {
      hasSub.value = true;
      subCatId.value = adsDetail.value!.subCategoryId!;
      subCategoryFieldController.text = adsDetail.value!.subcategory!.title!;
      catSubTitle.value = adsDetail.value!.subcategory;
    }
    ipc.editImages.value = adsDetail.value!.images!;
    ipc.isEdit.value = true;

    if (adsDetail.value != null && adsDetail.value!.fields != null) {
      for (int i = 0; i < adsDetail.value!.fields!.length; i++) {
        String? label = adsDetail.value!.fields![i].label;
        String? value = adsDetail.value!.fields![i].value;

        fieldControllers[label!] = TextEditingController(text: value);
      }
    }
    fieldControllers.forEach((label, controller) {
      print('Label: $label');
      print('Value: ${controller.text}');
    });
  }

  void categoryData() {
    CategoryRepo.fetchCategoryData(onSuccess: (fetchedCategoryDetails) {
      categoryDetails.value = fetchedCategoryDetails;
      isCategoryLoading.value = false;
      if (categoryDetails.isEmpty) {
        isCategoryEmpty.value = true;
      }
    }, onError: (message) {
      BarterSnackBar.error(title: "Render Error", message: message);
      isCategoryLoading.value = false;
    });
  }

  RxString catTitle = "".obs;

  RxString catId = "".obs;

  RxBool hasSub = false.obs;

  Rxn<CategoryDetails> catSubTitle = Rxn<CategoryDetails>();
  // Rxn<CategoryDetails> selectedCategory = Rxn<CategoryDetails>();

  RxString subCatId = "".obs;
  RxList<CategoryDetails> subCategoryDetails = RxList();
  RxList<CategoryDetails> category = RxList();
  var isSubCategoryLoading = true.obs;

  void fetchSubCategoryData() {
    SubCategoryRepo.fetchSubCategoryData(
      id: catId.value,
      onSuccess: (fetchedSubCategory) {
        subCategoryDetails.value = fetchedSubCategory;

        // print(subCategoryDetails[0].fields![1].id);

        isSubCategoryLoading.value = false;
        if (subCategoryDetails.isEmpty) {
         
        }
      },
      onError: (message) {
        BarterSnackBar.error(title: "Render Error", message: message);
      },
    );
  }

  RxList<String> fieldsOptions = RxList();
  RxMap labelDataMap = {}.obs;
  late int required;
  late int labelsCount;
  RxList<FieldDetails> fieldsData = RxList();
  RxMap<String, TextEditingController> fieldControllers = RxMap();

  void fetchFieldsData() {
    if (hasSub.value) {
      SubCategoryRepo.fetchSubCategoryData(
        id: catId.value,
        onSuccess: (fetchedSubCategory) {
          isLoading.value = false;
          category.value = fetchedSubCategory;

          for (int i = 0; i < category.length; i++) {
            CategoryDetails cd = category[i];

            if (cd.title == catSubTitle.value?.title) {
              fieldsData.value = cd.fields!;
            }
          }
          isSubCategoryLoading.value = false;
          if (subCategoryDetails.isEmpty) {
      
          }
        },
        onError: (message) {
          BarterSnackBar.error(title: "Render Error", message: message);
        },
      );
    } else {}
  }

  void generateFieldControllers() {
    for (FieldDetails field in catSubTitle.value!.fields ?? []) {
      fieldControllers[field.label!] = TextEditingController();
    }
  }

  RxBool isFeatured = false.obs;
  List<Placemark>? placemark;
  String? positionName;
  double? adsLongitude;
  double? adsLatitude;
  Future<void> getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> place = await GeocodingPlatform.instance
        .placemarkFromCoordinates(position.latitude, position.longitude);
    placemark = place;
    adsLatitude = position.latitude;
    adsLatitude = position.latitude;
    positionName = placemark![0].locality.toString();
  }

  void postAds(BuildContext context) {
    print(fieldControllers.toString());
    PostAdsModel myModel = PostAdsModel(
      categoryId: catId.value,
      // subcategoryId: subCatId.value,
      subcategoryId: subCatId.value,
      title: titleFieldController.text,
      description: descriptionFieldController.text,
      position: AdsPosition(
        name: positionName,
        latLng: LatLng(
          latitude: adsLatitude,
          longitude: adsLongitude,
        ),
      ),
      latitude: adsLatitude.toString(),
      longitude: adsLongitude.toString(),
      isFeatured: isFeatured.value,
      price: int.tryParse(priceFieldController.text) ?? 0,
      fields: fieldControllers.entries
          .map((entry) => Fields(
                label: entry.key,
                value: entry.value.text,
              ))
          .toList(),
      images: ipc.images,
    );

    PostAdsRepo.postAds(
        postAds: myModel,
        onSuccess: () {
          isLoading.value = false;
          BarterSnackBar.success(title: "Success ", message: "Ads added succesfully");
          c.myActiveAds.clear();
          c.myExpiredAds.clear();
          c.myInactiveAds.clear();
          c.fetchActiveAdsData();
          c.fetchExpiredAdsData();
          c.fetchInactiveAdsData();
          Get.delete<CreateAdsController>();
          Navigator.pop(context);
          Get.toNamed(MyAdsPage.routeName);
          BarterSnackBar.success(title: "Create Ads Error", message: "Ad posted succesfully");
        },
        onError: (errorMessage) {
          BarterSnackBar.error(title: "Create Ads Error", message: errorMessage);
        });
  }
}
