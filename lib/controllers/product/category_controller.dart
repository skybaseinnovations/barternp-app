import 'package:barter_app_2023/Repos/home/sub_categories_repo.dart';
import 'package:get/get.dart';

import '../../Repos/home/categories_repo.dart';
import '../../models/categories.dart';
import '../../widgets/custom/custom_snackbar.dart';

class CategoryController extends GetxController {
  late String id;
  late bool hasSubCategory;
  late String title;
  @override
  void onInit() {
    var categoryId = Get.arguments;
    id = categoryId["id"];
    hasSubCategory = categoryId["subCategory"];
    title = categoryId["title"];
    fetchData(id);
    super.onInit();
  }

  RxList<CategoryDetails> subCategoryDetails = RxList();
  var isSubCategoryLoading = true.obs;
  var isSubCategoryEmpty = true.obs;
  void fetchData(fid) {
    SubCategoryRepo.fetchSubCategoryData(
      id: fid,
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
