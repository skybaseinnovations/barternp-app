import 'package:barter_app_2023/controllers/dashboard/home_page_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/views/dashboard/home/categories_page.dart';
import 'package:barter_app_2023/widgets/custom/custom_tab_bar.dart';
import 'package:barter_app_2023/widgets/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../widgets/custom/custom_categories_item.dart';
import '../../../widgets/row/product_item_tile.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/homePage";

  HomePage({super.key});
  final hpc = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGreyColor,
      body: SingleChildScrollView(
        controller: hpc.scrollController,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              const CustomTextField(
                  fillColor: AppColor.searchFieldColor,
                  prefixIcon: Icon(Icons.search),
                  hint: 'Search',
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 36,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CarouselSlider.builder(
                  itemCount: hpc.bannerImageUrl.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: hpc.bannerImageUrl[index],
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
              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Categories",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  InkWell(
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
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 152,
                width: 342,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: Get.width - 70,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomCategoriesItem(
                              categoryName: "Mobile",
                              imageName:
                                  "https://th.bing.com/th/id/OIP.rcrrrL1gIKMugGWkn01XdwHaHZ?w=182&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                          CustomCategoriesItem(
                            categoryName: "Laptop",
                            imageName:
                                "https://th.bing.com/th/id/OIP.Pl-BFLckE_RVkWZYyuJzGgHaDa?w=312&h=161&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                          ),
                          CustomCategoriesItem(
                            categoryName: "Car",
                            imageName:
                                "https://i.pinimg.com/736x/37/95/39/3795395e51af1728c2deb1e5a414773b--birthday-gifts-happy-birthday.jpg",
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width - 40,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomCategoriesItem(
                            categoryName: "Bike",
                            imageName:
                                "https://i.pinimg.com/originals/7f/2c/71/7f2c715050034570d88e24f9371bf562.jpg",
                          ),
                          CustomCategoriesItem(
                              categoryName: "Animals",
                              imageName:
                                  "https://th.bing.com/th/id/R.b6fae2128d03a0f31a04bd2bf5b99ec8?rik=wXsbVJfTU%2b53jw&pid=ImgRaw&r=0"),
                          CustomCategoriesItem(
                            categoryName: "Land",
                            imageName:
                                "https://th.bing.com/th/id/OIP.P_hhkWTCeNWYjQu0O1M-WQHaHa?w=174&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => CustomTabBar(
                      animation: Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
                          .animate(hpc.tabAnimationController.animationController),
                      title: 'Featured',
                      onTap: () {
                        hpc.tabAnimationController.animationController.reverse();
                        hpc.showFeaturedPage();
                      },
                      isActive: hpc.currentIndex.value == 0,
                    ),
                  ),
                  Obx(
                    () => CustomTabBar(
                      animation: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                          .animate(hpc.tabAnimationController.animationController),
                      title: 'Nearby Ads',
                      onTap: () {
                        hpc.tabAnimationController.animationController.forward();
                        hpc.showNearbyAds();
                      },
                      isActive: hpc.currentIndex.value == 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "View All",
                      style: TextStyle(fontSize: 12, color: AppColor.secondaryColor),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Obx(
                () => SizedBox(
                  height: hpc.currentIndex.value == 0
                      ? hpc.featuredImageUrl.length * 172 + 20
                      : hpc.nearbyAdsImageUrl.length * 172 + 20,
                  child: PageView(
                    pageSnapping: false,
                    key: const PageStorageKey(2),
                    physics: const NeverScrollableScrollPhysics(),
                    controller: hpc.pageController.value,
                    allowImplicitScrolling: true,
                    children: [
                      Container(
                        color: Colors.white,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) =>
                                CustomItemTile(imageUrl: hpc.featuredImageUrl[index]),
                            itemCount: hpc.featuredImageUrl.length),
                      ),
                      Container(
                        color: Colors.white,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) =>
                                CustomItemTile(imageUrl: hpc.nearbyAdsImageUrl[index]),
                            itemCount: hpc.nearbyAdsImageUrl.length),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
