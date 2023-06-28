import 'package:barter_app_2023/controllers/dashboard/my_ads_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/error_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/row/product_item_tile.dart';
import '../../../widgets/shimmer/barter_shimmer.dart';
import '../../product/product_detail.dart';

class MyAdsPage extends StatelessWidget {
  static const String routeName = "/myAdsPage/";
  final c = Get.find<MyAdsPageController>();
  MyAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const BarterAppBar(
                  hasLeading: false,
                  title: Text(
                    "My Ads",
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
                // const CustomTextField(
                //   fillColor: AppColor.searchFieldColor,
                //   prefixIcon: Icon(Icons.search),
                //   hint: 'Search',
                //   textInputAction: TextInputAction.done,
                //   textInputType: TextInputType.text,
                // ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  // height: 100,
                  child: TabBar(
                    // indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                    unselectedLabelColor: AppColor.secondaryTextColor,
                    labelColor: AppColor.primaryTextColor,
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryTextColor),
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryTextColor),
                    dividerColor: AppColor.primaryTextColor,
                    indicatorColor: AppColor.primaryTextColor,
                    indicatorWeight: 3,
                    controller: c.tabController,

                    tabs: const [
                      Tab(
                        text: "Active Ads",
                      ),
                      Tab(
                        text: "Inactive Ads",
                      ),
                      Tab(
                        text: "Expired Ads",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: TabBarView(controller: c.tabController, children: [
                    Container(
                      color: Colors.white,
                      child: Obx(() => c.isActivePageLoading.value
                          ? ListView.builder(
                              padding: const EdgeInsets.only(top: 5),
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return BarterShimmer.productItemShimmer();
                              },
                            )
                          : c.myActiveAds.isEmpty
                              ? const BarterErrorPage(
                                  imagePath: ImagePath.myAdsErrorImagePath,
                                  title: "Nothing to show here ",
                                  subTitle: "Post new ads",
                                )
                              : ListView.builder(
                                  controller: c.activePageScrollController,
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: c.myActiveAds.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == c.myActiveAds.length) {
                                      return c.activeAdsNextPageUrl.value == null
                                          ? Container()
                                          : const Center(
                                              child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: CircularProgressIndicator(
                                                    color: AppColor.primaryColor,
                                                    strokeWidth: 2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                )
                                              ],
                                            ));
                                    }
                                    return CustomItemTile(
                                      adsModel: c.myActiveAds[index],
                                      isMyAds: true,
                                      onTap: () => Get.toNamed(ProductDetailPage.routeName,
                                          arguments: {
                                            "isMyAds": true,
                                            "adId": c.myActiveAds[index].id
                                          }),
                                    );
                                  },
                                )),
                    ),
                    Container(
                      color: Colors.white,
                      child: Obx(() => c.isInactivePageLoading.value
                          ? ListView.builder(
                              padding: const EdgeInsets.only(top: 5),
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return BarterShimmer.productItemShimmer();
                              },
                            )
                          : c.myInactiveAds.isEmpty
                              ? const BarterErrorPage(
                                  imagePath: ImagePath.myAdsErrorImagePath,
                                  title: "Nothing to show here ",
                                  subTitle: "Post new ads",
                                )
                              : ListView.builder(
                                  controller: c.inActivePageScrollController,
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: c.myInactiveAds.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == c.myInactiveAds.length) {
                                      return c.inActiveAdsNextPageUrl.value == null
                                          ? Container()
                                          : const Center(
                                              child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: CircularProgressIndicator(
                                                    color: AppColor.primaryColor,
                                                    strokeWidth: 2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                )
                                              ],
                                            ));
                                    }
                                    return CustomItemTile(
                                      adsModel: c.myInactiveAds[index],
                                      isMyAds: true,
                                      onTap: () => Get.toNamed(ProductDetailPage.routeName,
                                          arguments: {
                                            "isMyAds": true,
                                            "adId": c.myInactiveAds[index].id
                                          }),
                                    );
                                  },
                                )),
                    ),
                    Container(
                      color: Colors.white,
                      child: Obx(() => c.isExpiredPageLoading.value
                          ? ListView.builder(
                              padding: const EdgeInsets.only(top: 5),
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return BarterShimmer.productItemShimmer();
                              },
                            )
                          : c.myExpiredAds.isEmpty
                              ? const BarterErrorPage(
                                  imagePath: ImagePath.myAdsErrorImagePath,
                                  title: "Nothing to show here ",
                                  subTitle: "Post new ads",
                                )
                              : ListView.builder(
                                  controller: c.expiredPageScrollController,
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: c.myExpiredAds.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == c.myExpiredAds.length) {
                                      return c.expiredAdsNextPageUrl.value == null
                                          ? Container()
                                          : const Center(
                                              child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: CircularProgressIndicator(
                                                    color: AppColor.primaryColor,
                                                    strokeWidth: 2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                )
                                              ],
                                            ));
                                    }
                                    return CustomItemTile(
                                      adsModel: c.myExpiredAds[index],
                                      isMyAds: true,
                                      onTap: () => Get.toNamed(ProductDetailPage.routeName,
                                          arguments: {
                                            "isMyAds": true,
                                            "adId": c.myExpiredAds[index].id
                                          }),
                                    );
                                  },
                                )),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
