import 'package:barter_app_2023/models/ads_model.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItemTile extends StatelessWidget {
  final AdsDetail adsModel;
  final String? imageUrl;

  final bool isMyAds;
  final bool isFavourite;
  final VoidCallback? onTap;

  const CustomItemTile({
    super.key,
    required this.adsModel,
    this.imageUrl,
    this.isMyAds = false,
    this.isFavourite = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.only(bottom: 20, left: 13, right: 13, top: 13),
        height: 152,
        width: 342,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 4, // Spread radius
                blurRadius: 14, // Blur radius
                offset: const Offset(-1, 2),
                color: const Color(0xff9f9f9f).withOpacity(0.25))
          ],
        ),
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
                  errorWidget: (context, url, error) => Image.asset(ImagePath.placeHolderPath),
                  placeholder: (context, url) => Image.asset(ImagePath.placeHolderPath),
                  imageUrl: adsModel.thumbnail ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Stack(
                  children: [
                    AdsDetail.isfeatured(adsModel.isFeatured)
                        ? Positioned(
                            right: 5,
                            child: SvgPicture.asset(ImagePath.bookmarkIconPath),
                          )
                        : Positioned(
                            right: 5,
                            child: Container(),
                          ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: adsModel.category?.title == null
                                      ? Container()
                                      : Container(
                                          height: 20,
                                          width: 10,
                                          decoration: const BoxDecoration(
                                              color: Color(0xffEAE8E8),
                                              borderRadius: BorderRadius.all(Radius.circular(4))),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              adsModel.category!.title!,
                                              style: const TextStyle(
                                                  fontSize: 12, color: AppColor.secondaryColor),
                                            ),
                                          ),
                                        )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: adsModel.subcategory?.title == null
                                      ? Container()
                                      : Container(
                                          height: 20,
                                          decoration: const BoxDecoration(
                                              color: Color(0xffEAE8E8),
                                              borderRadius: BorderRadius.all(Radius.circular(4))),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              adsModel.subcategory?.title ?? "",
                                              style: const TextStyle(
                                                  fontSize: 12, color: AppColor.secondaryColor),
                                            ),
                                          ),
                                        )),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    textAlign: TextAlign.end,
                                    adsModel.location ?? "",
                                    style: const TextStyle(
                                        fontSize: 12, color: AppColor.secondaryColor),
                                  ))
                            ],
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  adsModel.title ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.primaryTextColor),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  adsModel.updatedAt != null
                                      ? AdsDetail.returnDate(adsModel.updatedAt!)
                                      : "",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 12, color: AppColor.tertiaryTextColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        isMyAds
                            ? Container()
                            : Flexible(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    adsModel.description ?? "",
                                    style: const TextStyle(
                                        fontSize: 13, color: AppColor.tertiaryTextColor),
                                  ),
                                ),
                              ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Rs ${adsModel.price ?? ""}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryColor),
                                    ),
                                    isMyAds
                                        ? Container()
                                        : Container(
                                            margin: const EdgeInsets.symmetric(horizontal: 5),
                                            height: 20,
                                            color: AppColor.primaryTextColor,
                                            width: 1,
                                          ),
                                    isMyAds
                                        ? Container()
                                        : Flexible(
                                            flex: 1,
                                            child: Text(
                                              adsModel.seller != null
                                                  ? adsModel.seller!.name ?? ""
                                                  : "",
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 12, color: AppColor.primaryTextColor),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              isFavourite
                                  ? const Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          size: 20,
                                          color: Color(0xffF62457),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        const SizedBox(
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
