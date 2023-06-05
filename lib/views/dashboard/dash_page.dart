import 'package:barter_app_2023/controllers/dashboard/dash_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashPage extends StatelessWidget {
  static const String routeName = "/dashPapge/";
  DashPage({super.key});
  final dpc = Get.find<DashPageController>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Dash page"),
        ),
      ),
    );
  }
}
