import 'package:barter_app_2023/models/access_token_model.dart';
import 'package:barter_app_2023/models/user_model.dart';
import 'package:barter_app_2023/utils/helpers/storage_helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CoreController extends GetxController {
  Rx<User?> currentUser = Rxn<User>();
  AccessToken? accessToken = AccessToken();
  @override
  void onInit() {
    loadCurrentUser();

    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    accessToken = StorageHelper.getAccessToken();
    currentUser.value = StorageHelper.getUser();
  }

  isUserLoggedIn() {
    return currentUser.value != null;
  }

  loggedOut() {
    var box = GetStorage();
    box.erase();
  }
}
