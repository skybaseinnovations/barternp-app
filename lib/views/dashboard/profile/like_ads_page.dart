import 'package:barter_app_2023/controllers/dashboard/profile/like_ads_controller.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/shimmer/barter_shimmer.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants/image_paths.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/row/product_item_tile.dart';
import '../../product/product_detail.dart';

class LikedAds extends StatelessWidget {
  static const String routeName = "/likedAds/";
  final c = Get.find<LikedAdsController>();
  LikedAds({super.key});

  @override
  Widget build(BuildContext context) {
    c.fetchFeaturedAdsData();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 24, right: 24, bottom: 35),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const BarterAppBar(
                hasLeading: true,
                title: Text(
                  "Liked Ads",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 41,
              // ),
              // CustomTextField(
              //   controller: c.searchController,
              //   fillColor: AppColor.searchFieldColor,
              //   prefixIcon: const Icon(
              //     Icons.search,
              //     color: AppColor.secondaryTextColor,
              //   ),
              //   hint: 'Search',
              //   textInputAction: TextInputAction.done,
              //   textInputType: TextInputType.text,
              // ),
              // const SizedBox(
              //   height: 41,
              // ),
              Expanded(
                child: Obx(
                  () => c.isLikeAdPageLoading.value
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return BarterShimmer.productItemShimmer();
                          },
                        )
                      : c.favouriteAds.isEmpty
                          ? const BarterErrorPage(
                              imagePath: ImagePath.likedAdsErrorImagePath,
                              title: "No liked ads yet",
                              subTitle: "Start favouriting ads",
                            )
                          : Obx(() => ListView.builder(
                              padding: const EdgeInsets.only(top: 10),
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: c.favouriteAds.length,
                              itemBuilder: (context, index) {
                                return CustomItemTile(
                                  isFavourite: true,
                                  adsModel: c.favouriteAds[index],
                                  onTap: () => Get.toNamed(ProductDetailPage.routeName, arguments: {
                                    "isMyAds": false,
                                    "adId": c.favouriteAds[index].id
                                  }),
                                );
                              })),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
