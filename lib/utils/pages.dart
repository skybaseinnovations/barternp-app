import 'package:barter_app_2023/controllers/auth/create_profile_page_controller.dart';
import 'package:barter_app_2023/controllers/auth/login_page_controller.dart';
import 'package:barter_app_2023/controllers/auth/verification_page_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/chat/chat_page_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/chat/chatting_page_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/dash_page_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/home_page_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/profile/edit_profile_page_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/my_ads_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/chat/search_chat_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/profile/like_ads_controller.dart';
import 'package:barter_app_2023/controllers/product/product_details_controller.dart';
import 'package:barter_app_2023/controllers/splash_page_controller.dart';
import 'package:barter_app_2023/views/auth/create_profile_page.dart';
import 'package:barter_app_2023/views/auth/login_page.dart';
import 'package:barter_app_2023/views/auth/verification_page.dart';
import 'package:barter_app_2023/views/dashboard/chat/chatting_page.dart';
import 'package:barter_app_2023/views/dashboard/chat/search_chat_page.dart';
import 'package:barter_app_2023/views/dashboard/dash_page.dart';
import 'package:barter_app_2023/views/dashboard/profile/edit_profile_page.dart';
import 'package:barter_app_2023/views/dashboard/home/categories_page.dart';
import 'package:barter_app_2023/views/dashboard/home/single_category_page.dart';
import 'package:barter_app_2023/views/dashboard/profile/like_ads_page.dart';
import 'package:barter_app_2023/views/dashboard/profile/profile_page.dart';
import 'package:barter_app_2023/views/dashboard/home/search_page.dart';
import 'package:barter_app_2023/views/product/create_ads_page.dart';
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
        Get.lazyPut(() => MyAdsPageController());
        Get.lazyPut(() => ChatPageController());
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
      name: SearchPage.routeName,
      page: () => SearchPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomePageController());
      })),
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
  GetPage(
    name: CategoriesPage.routeName,
    page: () => CategoriesPage(),
  ),
  GetPage(
    name: SingleCategory.routeName,
    page: () => SingleCategory(),
  ),
  GetPage(
    name: SearchChatPage.routeName,
    page: () => SearchChatPage(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => SearchChatPageController());
      },
    ),
  ),
  GetPage(
    name: ChattingPage.routeName,
    page: () => ChattingPage(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => ChattingPageController());
      },
    ),
  ),
  GetPage(
    name: CreateAdsPage.routeName,
    page: () => CreateAdsPage(),
  ),
  GetPage(
    name: LikedAds.routeName,
    page: () => LikedAds(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => LikedAdsController());
      },
    ),
  ),
];
