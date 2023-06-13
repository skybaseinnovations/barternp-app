import 'package:barter_app_2023/controllers/core_controller.dart';
import 'package:barter_app_2023/utils/pages.dart';
import 'package:barter_app_2023/views/dashboard/dash_page.dart';
import 'package:barter_app_2023/views/dashboard/home/search_page.dart';
import 'package:barter_app_2023/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(const BarterApp());
}

class BarterApp extends StatelessWidget {
  const BarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Libre Franklin",
      ),
      initialBinding: BindingsBuilder(
        () {
          Get.put(CoreController());
        },
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: DashPage.routeName,
      getPages: getPages,
    );
  }
}
