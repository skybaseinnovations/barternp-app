import 'package:barter_app_2023/Repos/post_ads_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../Repos/products/categories_repo.dart';
import '../../Repos/products/sub_categories_repo.dart';
import 'package:barter_app_2023/widgets/custom/custom_snackbar.dart';
import '../../models/categories.dart';
import '../../models/fields_model.dart';
import '../../models/post_ads_model.dart';

class CreateAdsController extends GetxController {
  final currentStep = 0.obs;
  TextEditingController titleFieldController = TextEditingController();
  TextEditingController descriptionFieldController = TextEditingController();
  TextEditingController priceFieldController = TextEditingController();
  TextEditingController categoryFieldController = TextEditingController();
  TextEditingController subCategoryFieldController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var fieldsFormKey = GlobalKey<FormState>();

  RxList<CategoryDetails> categoryDetails = RxList();

  var isCategoryLoading = true.obs;
  var isCategoryEmpty = false.obs;

  late List<Step> steps;
  @override
  void onInit() {
    categoryData();
    super.onInit();
  }

  onSubmit() {
    if (formKey.currentState!.validate()) {
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
  RxString AcatTitle = "".obs;
  RxString catId = "".obs;
  RxString AcatId = "".obs;
  bool hasSub = false;
  bool AhasSub = false;

  Rxn<CategoryDetails> catSubTitle = Rxn<CategoryDetails>();
  // Rxn<CategoryDetails> selectedCategory = Rxn<CategoryDetails>();
  RxString AcatSubTitle = "".obs;
  RxString subCatId = "".obs;
  bool type = true;
  RxList<CategoryDetails> subCategoryDetails = RxList();
  RxList<CategoryDetails> category = RxList();
  var isSubCategoryLoading = true.obs;
  var isSubCategoryEmpty = false.obs;
  void fetchSubCategoryData() {
    SubCategoryRepo.fetchSubCategoryData(
      id: type ? AcatId.value : catId.value,
      onSuccess: (fetchedSubCategory) {
        subCategoryDetails.value = fetchedSubCategory;
        isSubCategoryLoading.value = false;
        if (subCategoryDetails.isEmpty) {
          isSubCategoryEmpty.value = true;
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
    SubCategoryRepo.fetchSubCategoryData(
      id: catId.value,
      onSuccess: (fetchedSubCategory) {
        category.value = fetchedSubCategory;

        for (int i = 0; i < category.length; i++) {
          CategoryDetails cd = category[i];

          if (cd.title == catSubTitle.value?.title) {
            fieldsData.value = cd.fields!;
          }
        }
        isSubCategoryLoading.value = false;
        if (subCategoryDetails.isEmpty) {
          isSubCategoryEmpty.value = true;
        }
      },
      onError: (message) {
        BarterSnackBar.error(title: "Render Error", message: message);
      },
    );
  }

  void generateFieldControllers() {
    if (catSubTitle.value == null) return;
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

  void postAds() {
    PostAdsModel myModel = PostAdsModel(
      categoryId: catId.value,
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
    );

    PostAdsRepo.postAds(
        postAds: myModel,
        onSuccess: () {
          print("success");
        },
        onError: (errorMessage) {
          BarterSnackBar.error(title: "Create Profile Error", message: errorMessage);
        });
  }
}
