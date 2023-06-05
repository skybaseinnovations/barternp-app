import 'package:barter_app_2023/utils/pages.dart';
import 'package:barter_app_2023/views/auth/create_profile_page.dart';
import 'package:barter_app_2023/views/auth/verification_page.dart';
// import 'package:barter_app_2023/views/auth/login_page.dart';
import 'package:barter_app_2023/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const BarterApp());
}

class BarterApp extends StatelessWidget {
  const BarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Open Sans",
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: CreateProfilePage.routeName,
      getPages: getPages,
    );
  }
}
