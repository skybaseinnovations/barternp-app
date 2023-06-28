import 'package:barter_app_2023/Repos/products/fields_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Repos/products/categories_repo.dart';
import '../../Repos/products/sub_categories_repo.dart';

import '../../models/categories.dart';
import '../../models/fields_model.dart';
import '../../widgets/custom/custom_snackbar.dart';

class CreateAdsController extends GetxController {
  final currentStep = 0.obs;
  TextEditingController titleFieldController = TextEditingController();
  TextEditingController descriptionFieldController = TextEditingController();
  TextEditingController priceFieldController = TextEditingController();
  TextEditingController categoryFieldController = TextEditingController();
  TextEditingController subCategoryFieldController = TextEditingController();

  var formKey = GlobalKey<FormState>();
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
    subCategoryFieldController.text = catSubTitle.value;
    categoryFieldController.text = catTitle.value;
    if (formKey.currentState!.validate()) {
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
      BartarSnackBar.error(title: "Render Error", message: message);
      isCategoryLoading.value = false;
    });
  }

  RxString catTitle = "".obs;
  RxString AcatTitle = "".obs;
  RxString catId = "".obs;
  RxString AcatId = "".obs;
  bool hasSub = false;
  bool AhasSub = false;
  RxString catSubTitle = "".obs;
  RxString AcatSubTitle = "".obs;
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
        BartarSnackBar.error(title: "Render Error", message: message);
      },
    );
  }

  void fetchFieldsData() {
    SubCategoryRepo.fetchSubCategoryData(
      id: catId.value,
      onSuccess: (fetchedSubCategory) {
        category.value = fetchedSubCategory;

        for (int i = 0; i < category.length; i++) {
          CategoryDetails cd = category[i];
          if (cd.title == catSubTitle.value) {
            List<FieldDetails>? fd = cd.fields;
            for (int j = 0; j < fd!.length; j++) {
              print(fd[j].type);
            }
          }
        }
        isSubCategoryLoading.value = false;
        if (subCategoryDetails.isEmpty) {
          isSubCategoryEmpty.value = true;
        }
      },
      onError: (message) {
        BartarSnackBar.error(title: "Render Error", message: message);
      },
    );
  }

  RxList<FieldDetails> fieldsData = RxList();
  // void fetchFieldsData() {
  //   FieldsRepo.fetchFieldsData(
  //       id: catId.value,
  //       onSuccess: (fetchedFields) {
  //         fieldsData.value = fetchedFields;
  //         FieldDetails fg = fieldsData[0];
  //         print(fg);
  //       },
  //       onError: (message) {
  //         BartarSnackBar.error(title: "Render Error", message: message);
  //       });
  // }
}
