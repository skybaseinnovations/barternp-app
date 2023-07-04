import 'package:barter_app_2023/controllers/product/create_ads_controller.dart';

import 'package:barter_app_2023/utils/constants/colors.dart';

import 'package:barter_app_2023/widgets/shimmer/barter_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/categories.dart';
import '../../../utils/constants/image_paths.dart';
import '../../../widgets/custom/custom_app_bar.dart';

class SubCategoriesPage extends StatelessWidget {
  SubCategoriesPage({super.key});
  static const String routeName = "/subCategoriesPage";
  final c = Get.put(CreateAdsController());

  @override
  Widget build(BuildContext context) {
    c.fetchSubCategoryData();
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                child: BarterAppBar(
                    centerTitle: true,
                    hasLeading: true,
                    leadingWidth: 30,
                    title: Obx(
                      () => Text(
                        c.AcatTitle.value,
                        style: const TextStyle(color: AppColor.primaryTextColor),
                      ),
                    )),
              ),
              Obx(() => c.isSubCategoryLoading.value
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
                        itemCount: c.subCategoryDetails.length,
                        itemBuilder: (context, index) {
                          CategoryDetails subCategoryDetails = c.subCategoryDetails[index];

                          return Container(
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
                                    imageUrl: subCategoryDetails.thumbnail!,
                                    height: 110,
                                    width: 110,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  subCategoryDetails.title!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 13),
                                )
                              ],
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
