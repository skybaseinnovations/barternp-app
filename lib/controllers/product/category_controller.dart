import 'package:barter_app_2023/Repos/home/sub_categories_repo.dart';
import 'package:get/get.dart';

import '../../models/categories.dart';
import '../../widgets/custom/custom_snackbar.dart';

class SubCategoryController extends GetxController {
  late String id;
  late bool hasSubCategory;
  late String title;
  @override
  void onInit() {
    var categoryId = Get.arguments;
    id = categoryId["id"];
    hasSubCategory = categoryId["subCategory"];
    title = categoryId["title"];
    fetchData();
    super.onInit();
  }

  RxList<CategoryDetails> subCategoryDetails = RxList();
  var isSubCategoryLoading = true.obs;
  var isSubCategoryEmpty = true.obs;
  void fetchData() {
    SubCategoryRepo.fetchSubCategoryData(
      id: id,
      onSuccess: (fetchedSubCategory) {
        subCategoryDetails.value = fetchedSubCategory;
        isSubCategoryLoading.value = false;

        if (subCategoryDetails.isEmpty) {
          isSubCategoryEmpty.value = false;
        }
      },
      onError: (message) {
        BartarSnackBar.error(title: "Render Error", message: message);
      },
    );
  }
}
