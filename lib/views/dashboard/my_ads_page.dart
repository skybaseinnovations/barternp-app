import 'package:barter_app_2023/controllers/dashboard/my_ads_controller.dart';
import 'package:barter_app_2023/controllers/product/product_details_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/views/product/product_detail.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/custom/custom_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyAdsPage extends StatelessWidget {
  static const String routeName = "/myAdsPage/";
  final c = Get.find<MyAdsPageController>();
  final pdpc = Get.find<ProductDetailPageController>();
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
                            if (index == 0) {
                              return MyAdsTile(
                                imageUrl: "https://picsum.photos/200/300",
                                onTap: () {
                                  pdpc.isMyAds.value = true;
                                  Get.toNamed(ProductDetailPage.routeName);
                                },
                                isBookMarked: true,
                              );
                            }
                            return MyAdsTile(
                              imageUrl: "https://picsum.photos/200/300",
                              onTap: () {
                                pdpc.isMyAds.value = true;
                                Get.toNamed(ProductDetailPage.routeName);
                              },
                            );
                          },
                          itemCount: 5),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => MyAdsTile(
                                imageUrl: "https://picsum.photos/200/300",
                                onTap: () => Get.toNamed(ProductDetailPage.routeName),
                              ),
                          itemCount: 5),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => MyAdsTile(
                                imageUrl: "https://picsum.photos/200/300",
                                onTap: () => Get.toNamed(ProductDetailPage.routeName),
                              ),
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

class MyAdsTile extends StatelessWidget {
  final String imageUrl;
  final bool isBookMarked;
  final VoidCallback? onTap;
  const MyAdsTile({
    super.key,
    required this.imageUrl,
    this.isBookMarked = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
        height: 152,
        width: 342,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white, boxShadow: [
          BoxShadow(
              spreadRadius: 4, // Spread radius
              blurRadius: 14, // Blur radius
              offset: const Offset(-1, 2),
              color: const Color(0xff9F9F9F).withOpacity(0.25))
        ]),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  height: 106,
                  width: 106,
                  placeholder: (context, _) => const Center(
                      child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                      strokeWidth: 2,
                    ),
                  )),
                  errorWidget: (context, url, error) => Image.asset(
                    ImagePath.placeHolderPath,
                  ),
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Stack(
                  children: [
                    isBookMarked
                        ? Positioned(
                            right: 5,
                            child: SvgPicture.asset(ImagePath.bookmarkIconPath),
                          )
                        : Container(),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Mobile",
                                    style: TextStyle(fontSize: 12, color: AppColor.secondaryColor),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    "New",
                                    style: TextStyle(fontSize: 12, color: AppColor.secondaryColor),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Location",
                                    style: TextStyle(fontSize: 12, color: AppColor.secondaryColor),
                                  ))
                            ],
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    "iPhone14",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.primaryTextColor),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "2 days ago",
                                    style:
                                        TextStyle(fontSize: 12, color: AppColor.tertiaryTextColor),
                                  ))
                            ],
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Rs 100,000",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.primaryColor),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
