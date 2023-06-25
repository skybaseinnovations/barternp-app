import 'package:barter_app_2023/controllers/dashboard/profile/like_ads_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/custom/custom_textfield.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LikedAds extends StatelessWidget {
  static const String routeName = "/likedAds/";
  final c = Get.find<LikedAdsController>();
  LikedAds({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 24, right: 24, bottom: 35),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const BartarAppBar(
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
              const SizedBox(
                height: 41,
              ),
              CustomTextField(
                controller: c.searchController,
                fillColor: AppColor.searchFieldColor,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColor.secondaryTextColor,
                ),
                hint: 'Search',
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 41,
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container();
                      // if (index == 0) {
                      //   return CustomItemTile(
                      //     imageUrl: "https://picsum.photos/200/300",
                      //     onTap: () {
                      //       Get.toNamed(ProductDetailPage.routeName, arguments: true);
                      //     },
                      //     isFavourite: true,
                      //   );
                      // }
                      // return CustomItemTile(
                      //   imageUrl: "https://picsum.photos/200/300",
                      //   onTap: () {
                      //     Get.toNamed(ProductDetailPage.routeName, arguments: true);
                      //   },
                      //   isFavourite: true,
                      // );
                    },
                    itemCount: 5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
