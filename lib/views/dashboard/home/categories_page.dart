import 'package:barter_app_2023/controllers/dashboard/home_page_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/views/dashboard/home/single_category_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom/custom_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});
  static const String routeName = "/categoriesPage";
  final hpc = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGreyColor,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 30),
                child: BartarAppBar(
                  centerTitle: true,
                  hasLeading: true,
                  leadingWidth: 30,
                  title: Text(
                    "Categories",
                    style: TextStyle(color: AppColor.primaryTextColor),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 29,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: hpc.featuredImageUrl.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(SingleCategory.routeName);
                      },
                      child: Container(
                        height: 176,
                        width: 156,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: const Color(0xffa8a8a8).withOpacity(0.25),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: const Offset(-1, 2))
                        ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.fill,
                                  imageUrl: hpc.featuredImageUrl[index]),
                            ),
                            const Text(
                              "Mobile",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
