import 'package:barter_app_2023/controllers/product/create_ads_controller.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/categories.dart';
import '../../utils/constants/colors.dart';
import '../shimmer/barter_shimmer.dart';

class CustomCategoryBottomSheet extends StatelessWidget {
  CustomCategoryBottomSheet({
    super.key,
  });

  final c = Get.put(CreateAdsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          AppBar(
            elevation: 0,
            backgroundColor: AppColor.backgroundGreyColor,
            centerTitle: true,
            title: const Text(
              "Select Category",
              style: TextStyle(
                  color: AppColor.primaryTextColor, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            actions: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.close,
                      color: AppColor.primaryTextColor,
                    ),
                  ),
                  const SizedBox(
                    width: 27,
                  )
                ],
              )
            ],
          ),
          const Divider(
            height: 40,
            thickness: 1,
          ),
          Obx(() => c.isCategoryEmpty.value
              ? Container()
              : c.isCategoryLoading.value
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return BarterShimmer.selectCategoryItemShimmer();
                      },
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: c.categoryDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          CategoryDetails categoryDetail = c.categoryDetails[index];
                          if (categoryDetail.hasSubcategory ?? true) {
                            return InkWell(
                              onTap: () {
                                c.categoryFieldController.text = categoryDetail.title!;
                                c.catTitle.value = categoryDetail.title!;
                                c.catId.value = categoryDetail.id!;
                                if (categoryDetail.hasSubcategory!) {
                                  c.hasSub.value = true;
                                  c.catId.value = categoryDetail.id!;
                                  Navigator.pop(context);
                                } else {
                                  c.hasSub.value = false;
                                  Navigator.pop(context);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CachedNetworkImage(
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          Image.asset(ImagePath.placeHolderPath),
                                      imageUrl: categoryDetail.thumbnail!,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(categoryDetail.title!),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ))
        ],
      ),
    );
  }
}
