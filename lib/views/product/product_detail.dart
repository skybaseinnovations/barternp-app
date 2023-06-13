import 'package:barter_app_2023/controllers/product/product_details_controller.dart';
import 'package:barter_app_2023/utils/colors.dart';
import 'package:barter_app_2023/utils/image_paths.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/custom/custome_textfield.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

class ProductDetailPage extends StatelessWidget {
  static const String routeName = "/productDetailPage";
  final c = Get.find<ProductDetailPageController>();
  ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundGreyColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BartarAppBar(
                  hasLeading: true,
                  actions: [
                    Icon(
                      Icons.favorite_border_sharp,
                      color: AppColor.primaryTextColor,
                    ),
                  ],
                ),

                //photo caruaul here
                Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColor.backgroundGreyColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: CarouselSlider.builder(
                        itemCount: c.productImage.length,
                        itemBuilder: (context, index, realIndex) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              c.productImage[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        carouselController: c.buttonCarouselController,
                        options: CarouselOptions(
                          height: 290,
                          pageSnapping: true,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          onPageChanged: (index, reason) {
                            c.photoIndex.value = index + 1;
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 13,
                      right: 13,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColor.primaryTextColor,
                        ),
                        child: Obx(() => Text(
                              "${c.photoIndex.value}/${c.productImage.length}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),

                // tags details
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mobile",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColor.secondaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Used",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColor.secondaryColor,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "2 days ago",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColor.tertiaryTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 21,
                ),
                // product name
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "iPhone 8 Plus",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Rs 100,000",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffD9D9D9),
                          radius: 26,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Person Name",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primaryTextColor,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            IconText(
                              iconPath: ImagePath.contactIconPath,
                              title: "+977 9845210232",
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconText(iconPath: ImagePath.locationIconPath, title: "Address"),
                  ],
                ),
                const SizedBox(
                  height: 34,
                ),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus.Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus.",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),

                //
                const Text(
                  "Comments",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CommentListTile(),
                const SizedBox(
                  height: 15,
                ),

                const CommentListTile(),
                const SizedBox(
                  height: 15,
                ),

                const CommentListTile(),
                const SizedBox(
                  height: 15,
                ),
                //comment text field here
                const CustomTextField(
                  hint: "Your comment here...",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  fillColor: Color(0xffEBEDF1),
                  borderRadius: 16,
                ),
                const SizedBox(
                  height: 38,
                ),
                const Text(
                  "Similar Ads",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SimilarAdsWidget(),
                      SizedBox(
                        width: 31,
                      ),
                      SimilarAdsWidget(),
                      SizedBox(
                        width: 31,
                      ),
                      SimilarAdsWidget(),
                      SizedBox(
                        width: 31,
                      ),
                      SimilarAdsWidget(),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
        floatingActionButton: HawkFabMenu(
          fabColor: AppColor.secondaryColor,
          backgroundColor: Colors.transparent,
          body: Container(),
          icon: AnimatedIcons.menu_close,
          hawkFabMenuController: c.hawkFabMenuController,
          blur: 0,
          buttonBorder: BorderSide.none,
          items: [
            HawkFabMenuItem(
              label: 'Call',
              ontap: () {
                c.onCallTap();
              },
              color: AppColor.secondaryColor,
              icon: const Icon(Icons.phone),
              // color: Colors.red,
              // labelColor: Colors.blue,
            ),
            HawkFabMenuItem(
              label: 'Chat',
              ontap: () {
                c.onChatTap();
              },
              color: AppColor.secondaryColor,
              icon: const Icon(Icons.chat),
              // labelColor: Colors.white,
              // labelBackgroundColor: Colors.blue,
            ),
          ],
        ),
        // floatingActionButton: PopupMenuButton(
        //   position: PopupMenuPosition.over,
        //   splashRadius: 0,
        //   clipBehavior: Clip.none,
        //   onOpened: () {
        //     c.isPopMenuOpen.value = true;
        //   },
        //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 19),
        //   // elevation: 0,
        //   color: Colors.white,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(4.0),
        //     ),
        //   ),
        //   // position: PopupMenuPosition.under,
        //   offset: const Offset(0, -120),

        //   onSelected: (item) {
        //     if (item == "Call") {
        //       c.onCallTap();
        //       c.isPopMenuOpen.value = false;
        //     } else if (item == "Chat") {
        //       c.onChatTap();
        //       c.isPopMenuOpen.value = false;
        //     }
        //   },
        //   onCanceled: () {
        //     c.isPopMenuOpen.value = false;
        //   },
        //   itemBuilder: (BuildContext context) => [
        //     PopupMenuItem(
        //       value: "Call",
        //       child: Row(
        //         children: [
        //           SvgPicture.asset(
        //             ImagePath.contactIconPath,
        //             height: 10,
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           const Text(
        //             "Call",
        //             style: TextStyle(
        //               fontSize: 12,
        //               fontWeight: FontWeight.w400,
        //               color: AppColor.secondaryColor,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //     PopupMenuItem(
        //       value: "Chat",
        //       child: Row(
        //         children: [
        //           SvgPicture.asset(
        //             ImagePath.chatIconPath,
        //             height: 10,
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           const Text(
        //             "Chat",
        //             style: TextStyle(
        //               fontSize: 12,
        //               fontWeight: FontWeight.w400,
        //               color: AppColor.secondaryColor,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        //   child: Container(
        //     height: 45,
        //     width: 45,
        //     decoration: const BoxDecoration(
        //       color: AppColor.secondaryColor,
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(50),
        //       ),
        //     ),
        //     child: Obx(
        //       () => c.isPopMenuOpen.value
        //           ? SvgPicture.asset(
        //               ImagePath.cancelIconPath,
        //               fit: BoxFit.scaleDown,
        //             )
        //           : const Icon(
        //               Icons.menu,
        //               color: Colors.white,
        //             ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

class SimilarAdsWidget extends StatelessWidget {
  const SimilarAdsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 156,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          const Text(
            "iPhone 14 plus",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColor.primaryTextColor,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            "Rs 120,000",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}

class CommentListTile extends StatelessWidget {
  const CommentListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              color: const Color(0xff9F9F9F).withOpacity(.25),
              offset: const Offset(-1, 2),
              spreadRadius: 4,
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffD9D9D9),
                    radius: 26,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    // width: 209,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Person Name",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.primaryTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet consectetur adipiscing elit",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColor.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "2 days ago",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColor.tertiaryTextColor,
              ),
            ),
          ],
        ));
  }
}

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.iconPath,
    required this.title,
  });
  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColor.secondaryColor,
          ),
        )
      ],
    );
  }
}
