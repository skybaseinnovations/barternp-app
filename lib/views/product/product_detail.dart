import 'package:barter_app_2023/controllers/product/product_details_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/custom/custom_textfield.dart';
import 'package:barter_app_2023/widgets/shimmer/barter_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

import '../../models/ads_model.dart';
import '../../widgets/row/comment_item_tile.dart';
import '../../widgets/row/similar_ads_item.dart';

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
            child: Obx(() => c.isLoading.value
                ? BarterShimmer.productDetailPageShimmer()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BarterAppBar(
                          hasLeading: true,
                          actions: [
                            c.isMyAds.value
                                ? PopupMenuButton(
                                    splashRadius: 0,
                                    shadowColor: AppColor.tertiaryTextColor,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                                    position: PopupMenuPosition.under,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4.0),
                                      ),
                                    ),
                                    constraints:
                                        const BoxConstraints(minWidth: 119, minHeight: 123),
                                    onSelected: (value) {
                                      if (value == "Edit") {
                                        c.onEditTap();
                                      } else if (value == "Deactivate") {
                                        c.onDeactivateTap();
                                      } else if (value == "Delete") {
                                        c.onDeletetap();
                                      }
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      const PopupMenuItem(
                                        value: "Edit",
                                        child: Text(
                                          "Edit",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.secondaryColor,
                                          ),
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        value: "Deactivate",
                                        child: Text(
                                          "Deactivate",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.secondaryColor,
                                          ),
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        value: "Delete",
                                        child: Text(
                                          "Delete",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.secondaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                    child: const Icon(
                                      color: AppColor.secondaryTextColor,
                                      Icons.more_vert_rounded,
                                    ),
                                  )
                                : Obx(
                                    () => GestureDetector(
                                      onTap: c.onFavTap,
                                      child: c.isFavLoading.value
                                          ? const Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(right: 3),
                                                child: SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: CircularProgressIndicator(
                                                    color: AppColor.secondaryTextColor,
                                                    strokeWidth: 2,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : c.isFav.value
                                              ? const Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                )
                                              : const Icon(
                                                  Icons.favorite_border_sharp,
                                                  color: AppColor.primaryTextColor,
                                                ),
                                    ),
                                  ),
                          ],
                        ),

                        // //photo caruaul here
                        c.adsDetail.value!.images!.isEmpty
                            ? Container()
                            : Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: AppColor.backgroundGreyColor,
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: CarouselSlider.builder(
                                      itemCount: c.adsDetail.value!.images?.length,
                                      itemBuilder: (context, index, realIndex) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                            c.adsDetail.value!.images![index],
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
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        color: AppColor.primaryTextColor,
                                      ),
                                      child: Obx(() => Text(
                                            "${c.photoIndex.value}/${c.adsDetail.value!.images?.length}",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  c.adsDetail.value!.category?.title ?? "",
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.secondaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  c.adsDetail.value!.subcategory?.title ?? "",
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.secondaryColor,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              AdsDetail.returnDate(c.adsDetail.value!.updatedAt!),
                              style: const TextStyle(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              c.adsDetail.value!.title ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primaryTextColor,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Rs ${c.adsDetail.value!.price}",
                              style: const TextStyle(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 26,
                                  child: ClipOval(
                                      child: CachedNetworkImage(
                                    height: 106,
                                    width: 106,
                                    errorWidget: (context, url, error) =>
                                        Image.asset(ImagePath.defaultAvatar),
                                    placeholder: (context, url) =>
                                        Image.asset(ImagePath.defaultAvatar),
                                    imageUrl: c.adsDetail.value!.seller!.avatarUrl!,
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      c.adsDetail.value!.seller!.name!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.primaryTextColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    IconText(
                                      iconPath: ImagePath.contactIconPath,
                                      title: c.adsDetail.value!.seller!.phone ?? "",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconText(
                                iconPath: ImagePath.locationIconPath,
                                title: c.adsDetail.value!.seller!.location ?? ""),
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
                        Text(
                          c.adsDetail.value!.description!,
                          style: const TextStyle(
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
                        Obx(() => c.adsDetail.value!.comments!.isEmpty
                            ? const Center(
                                child: Text(
                                  "No comments to show. Please make a comment",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.secondaryTextColor,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: c.adsDetail.value!.comments?.length,
                                itemBuilder: (context, index) {
                                  print(c.adsDetail.value!.comments![index]);
                                  return CommentListTile(
                                    onLongTap: () {
                                      c.onDeleteComment(c.adsDetail.value!.comments![index].id!);
                                      Navigator.pop(Get.context!);
                                    },
                                    comment: c.adsDetail.value!.comments![index],
                                  );
                                },
                              )),

                        const SizedBox(
                          height: 15,
                        ),
                        //comment text field here
                        CustomTextField(
                          controller: c.commentController,
                          hint: "Your comment here...",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          fillColor: const Color(0xffEBEDF1),
                          borderRadius: 16,
                          onEditing: c.onComment,
                        ),

                        c.isMyAds.value
                            ? Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: c.similarAds!.map((similarAd) {
                                        return SimilarAdsWidget(
                                          similarAds: similarAd,
                                        );
                                      }).toList(),
                                    ),
                                  )
                                ],
                              )
                      ],
                    ),
                  )),
          )),
          floatingActionButton: c.isMyAds.value
              ? Container()
              : HawkFabMenu(
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
