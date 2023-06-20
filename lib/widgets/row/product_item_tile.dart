import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItemTile extends StatelessWidget {
  final String imageUrl;
  final bool isFeatured;
  final bool isMyAds;
  final bool isFavourite;
  final VoidCallback? onTap;

  const CustomItemTile({
    super.key,
    required this.imageUrl,
    this.isFeatured = false,
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
        margin: const EdgeInsets.only(bottom: 20, left: 8, right: 8),
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
                    isFeatured
                        ? Positioned(
                            right: 5,
                            child: SvgPicture.asset(ImagePath.bookmarkIconPath),
                          )
                        : Container(),
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
                                  child: Container(
                                    height: 20,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffEAE8E8),
                                        borderRadius: BorderRadius.all(Radius.circular(4))),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Mobile",
                                        style:
                                            TextStyle(fontSize: 12, color: AppColor.secondaryColor),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffEAE8E8),
                                        borderRadius: BorderRadius.all(Radius.circular(4))),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "New",
                                        style:
                                            TextStyle(fontSize: 12, color: AppColor.secondaryColor),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                width: 30,
                              ),
                              const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Location",
                                    style: TextStyle(fontSize: 12, color: AppColor.secondaryColor),
                                  ))
                            ],
                          ),
                        ),
                        const Flexible(
                          fit: FlexFit.loose,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "iPhone14",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.primaryTextColor),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "2 days ago",
                                  style: TextStyle(fontSize: 12, color: AppColor.tertiaryTextColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        isMyAds
                            ? Container()
                            : const Flexible(
                                child: Text(
                                  "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et. ...",
                                  style: TextStyle(fontSize: 13, color: AppColor.tertiaryTextColor),
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
                                    const Text(
                                      "Rs 100,000",
                                      style: TextStyle(
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
                                        : const Flexible(
                                            flex: 1,
                                            child: Text(
                                              "Sellers nameeeeeeeeeee",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
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
