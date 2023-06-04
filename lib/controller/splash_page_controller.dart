import 'package:barter_app_2023/views/auth/login_page.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offNamed(LoginPage.routeName);
      },
    );
    super.onInit();
  }
}
