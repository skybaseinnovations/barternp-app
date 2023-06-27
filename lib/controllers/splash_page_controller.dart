import 'package:barter_app_2023/controllers/core_controller.dart';
import 'package:barter_app_2023/views/auth/login_page.dart';
import 'package:barter_app_2023/views/dashboard/dash_page.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController {
  CoreController cc = Get.find<CoreController>();
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (cc.isUserLoggedIn()) {
          Get.offNamed(DashPage.routeName);
        } else {
          Get.offNamed(LoginPage.routeName);
        }
      },
    );
    super.onInit();
  }
}
