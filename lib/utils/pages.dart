import 'package:barter_app_2023/controllers/auth/create_profile_page_controller.dart';
import 'package:barter_app_2023/controllers/auth/login_page_controller.dart';
import 'package:barter_app_2023/controllers/auth/verification_page_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/dash_page_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/home_page_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/edit_profile_page_controller.dart';
import 'package:barter_app_2023/controllers/product/product_details_controller.dart';
import 'package:barter_app_2023/controllers/splash_page_controller.dart';
import 'package:barter_app_2023/views/auth/create_profile_page.dart';
import 'package:barter_app_2023/views/auth/login_page.dart';
import 'package:barter_app_2023/views/auth/verification_page.dart';
import 'package:barter_app_2023/views/dashboard/dash_page.dart';
import 'package:barter_app_2023/views/dashboard/edit_profile_page.dart';
import 'package:barter_app_2023/views/dashboard/profile_page.dart';
import 'package:barter_app_2023/views/product/product_detail.dart';
import 'package:barter_app_2023/views/splash_page.dart';
import 'package:get/get.dart';

var getPages = [
  GetPage(
    name: SplashPage.routeName,
    page: () => SplashPage(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => SplashPageController());
      },
    ),
  ),
  GetPage(
    name: LoginPage.routeName,
    page: () => LoginPage(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => LoginPageController());
      },
    ),
  ),
  GetPage(
    name: VerificationPage.routeName,
    page: () => VerificationPage(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => VerificationPageController());
      },
    ),
  ),
  GetPage(
    name: CreateProfilePage.routeName,
    page: () => CreateProfilePage(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => CreateProfilePageController());
      },
    ),
  ),
  GetPage(
    name: DashPage.routeName,
    page: () => DashPage(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => DashPageController());

        Get.lazyPut(() => HomePageController());
      },
    ),
  ),
  GetPage(
    arguments: Get.arguments,
    name: ProductDetailPage.routeName,
    page: () {
      // ProductDetails productDetails = Get.arguments[0];
      return ProductDetailPage();
    },
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => ProductDetailPageController());
      },
    ),
  ),
  GetPage(
    name: ProfilePage.routeName,
    page: () => ProfilePage(),
  ),
  GetPage(
    name: EditProfilePage.routeName,
    page: () => EditProfilePage(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => EditProfilePageController());
      },
    ),
  ),
];
