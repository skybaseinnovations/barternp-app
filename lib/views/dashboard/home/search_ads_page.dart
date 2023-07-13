import 'package:barter_app_2023/controllers/dashboard/home/search_ads_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/views/product/product_detail.dart';
import 'package:barter_app_2023/widgets/custom/custom_bottom_sheet.dart';
import 'package:barter_app_2023/widgets/error_page.dart';
import 'package:barter_app_2023/widgets/shimmer/barter_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom/custom_app_bar.dart';
import '../../../widgets/custom/custom_textfield.dart';
import '../../../widgets/row/product_item_tile.dart';

class SearchAdsPage extends StatelessWidget {
  SearchAdsPage({super.key});
  static const String routeName = "/searchAdsPage/";
  final c = Get.find<SearchAdsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGreyColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: SingleChildScrollView(
          controller: c.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: BarterAppBar(
                  centerTitle: true,
                  hasLeading: true,
                  leadingWidth: 30,
                  title: const Text(
                    "Search",
                    style: TextStyle(color: AppColor.primaryTextColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                controller: c.searchController,
                onEditing: () {
                  FocusScope.of(context).unfocus();
                  if (c.searchController.text.isEmpty) return;
                  FocusScope.of(context).unfocus();
                  c.isSearchedAdsLoading.value = true;
                  c.fetchSearchAdsData();
                },
                fillColor: AppColor.searchFieldColor,
                prefixIcon: const Icon(Icons.search),
                hint: 'Search',
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text(
                        "${c.searchedAds.length} Results found",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                      )),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => const CustomBottomSheet());
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(
                        Icons.tune,
                        color: AppColor.secondaryTextColor,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => c.isSearchedAdsLoading.value
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return BarterShimmer.productItemShimmer();
                        },
                      )
                    : c.searchedAds.isEmpty
                        ? const BarterErrorPage(
                            imagePath: ImagePath.searchErrorImagePath,
                            title: "No results found",
                            subTitle: "Search with new keywords",
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(top: 10),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: c.searchedAds.length + 1,
                            itemBuilder: (context, index) {
                              if (index == c.searchedAds.length) {
                                return c.nextPageUrl.value == null
                                    ? Container()
                                    : const Center(
                                        child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: AppColor.primaryColor,
                                          strokeWidth: 2,
                                        ),
                                      ));
                              }
                              return CustomItemTile(
                                adsModel: c.searchedAds[index],
                                onTap: () => Get.toNamed(ProductDetailPage.routeName,
                                    arguments: {"isMyAds": false, "adId": c.searchedAds[index].id}),
                              );
                            }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
