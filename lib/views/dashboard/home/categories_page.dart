import 'package:barter_app_2023/controllers/dashboard/home/home_page_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/views/dashboard/home/sub_categories.dart';
import 'package:barter_app_2023/widgets/shimmer/barter_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/categories.dart';
import '../../../utils/constants/image_paths.dart';
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
              Obx(() => hpc.isCategoryLoading.value
                  ? BarterShimmer.categoryShimmer()
                  : Container(
                      margin: const EdgeInsets.all(5),
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 29,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: hpc.categoryDetails.length,
                        itemBuilder: (context, index) {
                          CategoryDetails categoryDetail = hpc.categoryDetails[index];

                          return InkWell(
                            onTap: () {
                              categoryDetail.hasSubcategory!
                                  ? Get.toNamed(SubCategoriesPage.routeName, arguments: {
                                      'id': categoryDetail.id,
                                      'subCategory': true,
                                      'title': categoryDetail.title
                                    })
                                  : Get.toNamed(SubCategoriesPage.routeName, arguments: {
                                      'id': categoryDetail.id,
                                      'subCategory': false,
                                      'title': categoryDetail.title
                                    });
                            },
                            child: Container(
                              height: 165,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xffA8A8A8).withOpacity(0.25),
                                        blurRadius: 8,
                                        spreadRadius: 2,
                                        offset: const Offset(-1, 2)),
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) =>
                                          Image.asset(ImagePath.placeHolderPath),
                                      imageUrl: categoryDetail.thumbnail!,
                                      height: 110,
                                      width: 110,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    categoryDetail.title!,
                                    style: const TextStyle(fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )))
            ],
          ),
        ),
      )),
    );
  }
}
