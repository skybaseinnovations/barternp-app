import 'package:barter_app_2023/models/user_model.dart';
import 'package:barter_app_2023/utils/storage_helpers.dart';
import 'package:get/get.dart';

class CoreController extends GetxController {
  Rx<User?> currentUser = Rxn<User>();
  @override
  void onInit() {
    loadCurrentUser();
    super.onInit();
  }

  void loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
  }

  isUserLoggedIn() {
    return currentUser.value != null;
  }
  // loggedOut(){

  // }
}
