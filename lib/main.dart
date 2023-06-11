import 'package:barter_app_2023/utils/pages.dart';
import 'package:barter_app_2023/views/dashboard/dash_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        fontFamily: "Libre Franklin",
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: DashPage.routeName,
      getPages: getPages,
    );
  }
}
