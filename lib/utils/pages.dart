import 'package:barter_app_2023/controller/auth/create_profile_page_controller.dart';
import 'package:barter_app_2023/controller/auth/login_page_controller.dart';
import 'package:barter_app_2023/controller/auth/verification_page_controller.dart';
import 'package:barter_app_2023/controller/splash_page_controller.dart';
import 'package:barter_app_2023/views/auth/create_profile_page.dart';
import 'package:barter_app_2023/views/auth/login_page.dart';
import 'package:barter_app_2023/views/auth/verification_page.dart';
import 'package:barter_app_2023/views/splash_page.dart';
import 'package:get/get.dart';

var getPages = [
  GetPage(
    name: SplashPage.routeName,
    page: () => SplashPage(),
    binding: BindingsBuilder(
      () {
        Get.lazyReplace(() => SplashPageController());
      },
    ),
  ),
  GetPage(
    name: LoginPage.routeName,
    page: () => LoginPage(),
    binding: BindingsBuilder(
      () {
        Get.lazyReplace(() => LoginPageController());
      },
    ),
  ),
  GetPage(
    name: VerificationPage.routeName,
    page: () => VerificationPage(),
    binding: BindingsBuilder(
      () {
        Get.lazyReplace(() => VerificationPageController());
      },
    ),
  ),
  GetPage(
    name: CreateProfilePage.routeName,
    page: () => CreateProfilePage(),
    binding: BindingsBuilder(
      () {
        Get.lazyReplace(() => CreateProfilePageController());
      },
    ),
  ),
];
