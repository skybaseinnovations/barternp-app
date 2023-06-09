import 'package:barter_app_2023/controllers/product/create_ads_controller.dart';
import 'package:barter_app_2023/controllers/dashboard/home/home_page_controller.dart';
import 'package:barter_app_2023/models/categories.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/views/dashboard/home/categories_page.dart';

import 'package:barter_app_2023/views/dashboard/home/search_ads_page.dart';
import 'package:barter_app_2023/views/dashboard/home/sub_categories.dart';
import 'package:barter_app_2023/views/product/product_detail.dart';
import 'package:barter_app_2023/widgets/custom/custom_tab_bar.dart';
import 'package:barter_app_2023/widgets/custom/custom_textfield.dart';
import 'package:barter_app_2023/widgets/shimmer/barter_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../../controllers/dashboard/home/search_ads_controller.dart';
import '../../../models/banner_image_model.dart';
import '../../../widgets/custom/custom_categories_item.dart';
import '../../../widgets/row/product_item_tile.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/homePage";

  HomePage({super.key});
  final c = Get.find<HomePageController>();
  final sc = Get.find<SearchAdsController>();
  final cac = Get.put(CreateAdsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundGreyColor,
        body: SingleChildScrollView(
            controller: c.scrollController,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: CachedNetworkImage(
                                height: 42,
                                width: 42,
                                errorWidget: (context, url, error) =>
                                    Image.network(ImagePath.defaultAvatar),
                                imageUrl:
                                    'https://th.bing.com/th/id/R.dd29bfb51a11afd9aa7da46d51ecfb05?rik=uiHO1QE9tjr7YQ&pid=ImgRaw&r=0'),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome 👋",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primaryTextColor),
                              ),
                              Text(
                                "Jane ",
                                style: TextStyle(fontSize: 15, color: AppColor.secondaryTextColor),
                              )
                            ],
                          ),
                        ],
                      ),
                      badges.Badge(
                        position: badges.BadgePosition.custom(start: 11),
                        badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red
                            // badgeColor: Color(0xff2CE21D),
                            ),
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: AppColor.secondaryTextColor,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    // controller: sc.searchController,
                    fillColor: AppColor.searchFieldColor,
                    prefixIcon: const Icon(Icons.search),
                    hint: 'Search',
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    onEditing: () {
                      FocusScope.of(context).unfocus();
                      sc.searchController.text.isNotEmpty
                          ? Get.toNamed(
                              SearchAdsPage.routeName,
                              arguments: {
                                "adsName": sc.searchController.text,
                              },
                            )
                          : null;
                      sc.searchController.clear();
                    },
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Obx(
                    () => c.isBannerLoading.value
                        ? BarterShimmer.bannerShimmer()
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CarouselSlider.builder(
                              itemCount: c.banners.length,
                              itemBuilder: (context, index, realIndex) {
                                BannerImage banner = c.banners[index];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: banner.imageUrl!,
                                    fit: BoxFit.cover,
                                    width: Get.width - 60,
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                height: 114,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Categories",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(CategoriesPage.routeName);
                          },
                          child: const Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 11,
                                color: AppColor.secondaryColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(
                    () => c.isCategoryEmpty.value
                        ? Container()
                        : c.isCategoryLoading.value
                            ? BarterShimmer.categoryShimmer()
                            : InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  height: 152,
                                  width: 342,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: c.categoryDetails.length,
                                    itemBuilder: (context, index) {
                                      CategoryDetails categoryDetail = c.categoryDetails[index];
                                      return InkWell(
                                        onTap: () {
                                          cac.AcatId.value = categoryDetail.id!;
                                          cac.AcatTitle.value = categoryDetail.title!;

                                          categoryDetail.hasSubcategory!
                                              ? Get.toNamed(SubCategoriesPage.routeName,
                                                  arguments: {
                                                      'id': categoryDetail.id,
                                                      'subCategory': true,
                                                      'title': categoryDetail.title
                                                    })
                                              : Get.toNamed(SubCategoriesPage.routeName,
                                                  arguments: {
                                                      'id': categoryDetail.id,
                                                      'subCategory': false,
                                                      'title': categoryDetail.title
                                                    });
                                        },
                                        child: CustomCategoriesItem(
                                            categoryName: categoryDetail.title!,
                                            imageName: categoryDetail.thumbnail!),
                                      );
                                    },
                                  ),
                                ),
                              ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  StickyHeader(
                    header: Container(
                      color: AppColor.backgroundGreyColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          Obx(
                            () => CustomTabBar(
                              animation: Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
                                  .animate(c.tabAnimationController.animationController),
                              title: 'Featured',
                              onTap: () {
                                c.tabAnimationController.animationController.reverse();
                                c.showFeaturedPage();
                              },
                              isActive: c.currentIndex.value == 0,
                            ),
                          ),
                          Obx(
                            () => CustomTabBar(
                              animation: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                                  .animate(c.tabAnimationController.animationController),
                              title: 'Nearby Ads',
                              onTap: () {
                                c.tabAnimationController.animationController.forward();
                                c.showNearbyAds();
                              },
                              isActive: c.currentIndex.value == 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: InkWell(
                              onTap: c.onViewAllTap,
                              child: const Text(
                                "View All",
                                style: TextStyle(fontSize: 12, color: AppColor.secondaryColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    content: Obx(
                      () => SizedBox(
                        height: c.currentIndex.value == 0
                            ? (c.featuredAds.length * 172) >= Get.height - 180
                                ? (c.featuredAds.length * 172) + 20
                                : Get.height - 180
                            : (c.nearByAds.length * 172) >= Get.height
                                ? (c.nearByAds.length * 172) + 20
                                : Get.height - 150,
                        child: PageView(
                          pageSnapping: false,
                          key: const PageStorageKey(2),
                          physics: const NeverScrollableScrollPhysics(),
                          controller: c.pageController.value,
                          allowImplicitScrolling: true,
                          children: [
                            Obx(
                              () => c.isFeaturedAdsLoading.value
                                  ? ListView.builder(
                                      padding: const EdgeInsets.only(top: 5),
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return BarterShimmer.productItemShimmer();
                                      },
                                    )
                                  : Container(
                                      color: AppColor.backgroundGreyColor,
                                      child: ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            return CustomItemTile(
                                              adsModel: c.featuredAds[index],
                                              onTap: () => Get.toNamed(ProductDetailPage.routeName,
                                                  arguments: {
                                                    "isMyAds": false,
                                                    "adId": c.featuredAds[index].id
                                                  }),
                                            );
                                          },
                                          itemCount: c.featuredAds.length),
                                    ),
                            ),
                            Obx(() => c.isNearByAdsLoading.value
                                ? ListView.builder(
                                    padding: const EdgeInsets.only(top: 5),
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return BarterShimmer.productItemShimmer();
                                    },
                                  )
                                : Container(
                                    color: AppColor.backgroundGreyColor,
                                    child: ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) => CustomItemTile(
                                              adsModel: c.nearByAds[index],
                                              onTap: () => Get.toNamed(ProductDetailPage.routeName,
                                                  arguments: {
                                                    "isMyAds": false,
                                                    "adId": c.nearByAds[index].id
                                                  }),
                                            ),
                                        itemCount: c.nearByAds.length),
                                  )),
                          ],
                        ),
                      ),
                    ),
                  )
                ]))));
    // return GestureDetector(
    //   onTap: () {
    //     FocusScope.of(context).unfocus();
    //   },
    //   child: Scaffold(
    //     backgroundColor: AppColor.backgroundGreyColor,
    //     body: SingleChildScrollView(
    //       controller: hpc.scrollController,
    //       child: Container(
    //         margin: const EdgeInsets.symmetric(horizontal: 22),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             const SizedBox(height: 60),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   children: [
    //                     ClipOval(
    //                       child: CachedNetworkImage(
    //                           height: 42,
    //                           width: 42,
    //                           errorWidget: (context, url, error) =>
    //                               Image.network(ImagePath.defaultAvatar),
    //                           imageUrl:
    //                               'https://th.bing.com/th/id/R.dd29bfb51a11afd9aa7da46d51ecfb05?rik=uiHO1QE9tjr7YQ&pid=ImgRaw&r=0'),
    //                     ),
    //                     const SizedBox(
    //                       width: 17,
    //                     ),
    //                     const Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Welcome 👋",
    //                           style: TextStyle(
    //                               fontSize: 21,
    //                               fontWeight: FontWeight.w600,
    //                               color: AppColor.primaryTextColor),
    //                         ),
    //                         Text(
    //                           "Jane ",
    //                           style: TextStyle(fontSize: 15, color: AppColor.secondaryTextColor),
    //                         )
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 badges.Badge(
    //                   position: badges.BadgePosition.custom(start: 11),
    //                   badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red
    //                       // badgeColor: Color(0xff2CE21D),
    //                       ),
    //                   child: const Icon(
    //                     Icons.notifications_outlined,
    //                     color: AppColor.secondaryTextColor,
    //                     size: 25,
    //                   ),
    //                 )
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 30,
    //             ),
    //             CustomTextField(
    //                 fillColor: AppColor.searchFieldColor,
    //                 prefixIcon: const Icon(Icons.search),
    //                 hint: 'Search',
    //                 onEditing: () {
    //                   Get.toNamed(SearchPage.routeName);
    //                 },
    //                 textInputAction: TextInputAction.done,
    //                 textInputType: TextInputType.text),
    //             const SizedBox(
    //               height: 36,
    //             ),
    //             Obx(
    //               () => hpc.isBannerLoading.value
    //                   ? BarterShimmer.bannerShimmer()
    //                   : ClipRRect(
    //                       borderRadius: BorderRadius.circular(16),
    //                       child: CarouselSlider.builder(
    //                         itemCount: hpc.banners.length,
    //                         itemBuilder: (context, index, realIndex) {
    //                           BannerImage banner = hpc.banners[index];
    //                           return ClipRRect(
    //                             borderRadius: BorderRadius.circular(10),
    //                             child: CachedNetworkImage(
    //                               imageUrl: banner.imageUrl!,
    //                               fit: BoxFit.cover,
    //                               width: Get.width - 60,
    //                             ),
    //                           );
    //                         },
    //                         options: CarouselOptions(
    //                           height: 114,
    //                           aspectRatio: 16 / 9,
    //                           viewportFraction: 0.8,
    //                           initialPage: 0,
    //                           enableInfiniteScroll: true,
    //                           reverse: false,
    //                           autoPlay: true,
    //                           autoPlayInterval: const Duration(seconds: 3),
    //                           autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //                           autoPlayCurve: Curves.fastOutSlowIn,
    //                           enlargeCenterPage: true,
    //                           enlargeFactor: 0.3,
    //                           scrollDirection: Axis.horizontal,
    //                         ),
    //                       ),
    //                     ),
    //             ),
    //             const SizedBox(
    //               height: 36,
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 const Text("Categories",
    //                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 40.0),
    //                   child: InkWell(
    //                     onTap: () {
    //                       Get.toNamed(CategoriesPage.routeName);
    //                     },
    //                     child: const Text(
    //                       "View All",
    //                       style: TextStyle(
    //                           fontSize: 11,
    //                           color: AppColor.secondaryColor,
    //                           fontWeight: FontWeight.w400),
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 24,
    //             ),
    //             Obx(
    //               () => c.isCategoryEmpty.value
    //                   ? Container()
    //                   : c.isCategoryLoading.value
    //                       ? BarterShimmer.categoryShimmer()
    //                       : InkWell(
    //                           onTap: () {},
    //                           child: SizedBox(
    //                             height: 152,
    //                             width: 342,
    //                             child: ListView.builder(
    //                               scrollDirection: Axis.horizontal,
    //                               itemCount: c.categoryDetails.length,
    //                               itemBuilder: (context, index) {
    //                                 CategoryDetails categoryDetail = c.categoryDetails[index];
    //                                 return InkWell(
    //                                   onTap: () {
    //                                     c.AcatTitle.value = categoryDetail.title!;
    //                                     c.AhasSub = true;
    //                                     c.AcatId.value = categoryDetail.id!;
    //                                     c.AcatSubTitle.value = "";
    //                                     c.type = true;
    //                                     categoryDetail.hasSubcategory!
    //                                         ? Get.toNamed(SubCategoriesPage.routeName)
    //                                         : Get.toNamed(
    //                                             CategoriesPage.routeName); /*Go to ads page after*/
    //                                   },
    //                                   child: CustomCategoriesItem(
    //                                       categoryName: categoryDetail.title!,
    //                                       imageName: categoryDetail.thumbnail!),
    //                                 );
    //                               },
    //                             ),
    //                           ),
    //                         ),
    //             ),
    //             const SizedBox(
    //               height: 34,
    //             ),
    //             StickyHeader(
    //               header: Container(
    //                 color: AppColor.backgroundGreyColor,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     const SizedBox(
    //                       height: 70,
    //                     ),
    //                     Obx(
    //                       () => CustomTabBar(
    //                         animation: Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
    //                             .animate(hpc.tabAnimationController.animationController),
    //                         title: 'Featured',
    //                         onTap: () {
    //                           hpc.tabAnimationController.animationController.reverse();
    //                           hpc.showFeaturedPage();
    //                         },
    //                         isActive: hpc.currentIndex.value == 0,
    //                       ),
    //                     ),
    //                     Obx(
    //                       () => CustomTabBar(
    //                         animation: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
    //                             .animate(hpc.tabAnimationController.animationController),
    //                         title: 'Nearby Ads',
    //                         onTap: () {
    //                           hpc.tabAnimationController.animationController.forward();
    //                           hpc.showNearbyAds();
    //                         },
    //                         isActive: hpc.currentIndex.value == 1,
    //                       ),
    //                     ),
    //                     const Padding(
    //                       padding: EdgeInsets.only(bottom: 15.0),
    //                       child: Text(
    //                         "View All",
    //                         style: TextStyle(fontSize: 12, color: AppColor.secondaryColor),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               content: Obx(
    //                 () => SizedBox(
    //                   height: hpc.currentIndex.value == 0
    //                       ? (hpc.featuredImageUrl.length * 172) >= Get.height - 150
    //                           ? (hpc.featuredImageUrl.length * 172) + 20
    //                           : Get.height - 150
    //                       : (hpc.nearbyAdsImageUrl.length * 172) >= Get.height
    //                           ? (hpc.nearbyAdsImageUrl.length * 172) + 20
    //                           : Get.height - 150,
    //                   child: PageView(
    //                     pageSnapping: false,
    //                     key: const PageStorageKey(2),
    //                     physics: const NeverScrollableScrollPhysics(),
    //                     controller: hpc.pageController.value,
    //                     allowImplicitScrolling: true,
    //                     children: [
    //                       Container(
    //                         color: Colors.white,
    //                         child: ListView.builder(
    //                             physics: const NeverScrollableScrollPhysics(),
    //                             shrinkWrap: true,
    //                             scrollDirection: Axis.vertical,
    //                             itemBuilder: (context, index) =>
    //                                 CustomItemTile(imageUrl: hpc.featuredImageUrl[index]),
    //                             itemCount: hpc.featuredImageUrl.length),
    //                       ),
    //                       Container(
    //                         color: Colors.white,
    //                         child: ListView.builder(
    //                             physics: const NeverScrollableScrollPhysics(),
    //                             shrinkWrap: true,
    //                             scrollDirection: Axis.vertical,
    //                             itemBuilder: (context, index) =>
    //                                 CustomItemTile(imageUrl: hpc.nearbyAdsImageUrl[index]),
    //                             itemCount: hpc.nearbyAdsImageUrl.length),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
