import 'package:barter_app_2023/controllers/dashboard/my_ads_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/views/product/product_detail.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/row/product_item_tile.dart';
import 'package:barter_app_2023/widgets/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                const BartarAppBar(
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
                const SizedBox(
                  height: 41,
                ),
                const CustomTextField(
                  fillColor: AppColor.searchFieldColor,
                  prefixIcon: Icon(Icons.search),
                  hint: 'Search',
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 41,
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
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Container();
                            // if (index == 0) {
                            //   return CustomItemTile(
                            //     isMyAds: true,
                            //     imageUrl: "https://picsum.photos/200/300",
                            //     onTap: () {
                            //       Get.toNamed(ProductDetailPage.routeName, arguments: true);
                            //     },
                            //     isFeatured: true,
                            //   );
                            // }
                            // return CustomItemTile(
                            //   isMyAds: true,
                            //   imageUrl: "https://picsum.photos/200/300",
                            //   onTap: () {
                            //     Get.toNamed(ProductDetailPage.routeName, arguments: true);
                            //   },
                            // );
                          },
                          itemCount: 5),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Container(),
                          // CustomItemTile(
                          //       isMyAds: true,
                          //       imageUrl: "https://picsum.photos/200/300",
                          //       onTap: () => Get.toNamed(ProductDetailPage.routeName),
                          //     ),
                          itemCount: 5),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Container(),
                          // CustomItemTile(
                          //       isMyAds: true,
                          //       imageUrl: "https://picsum.photos/200/300",
                          //       onTap: () => Get.toNamed(ProductDetailPage.routeName),
                          //     ),
                          itemCount: 5),
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
