import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/views/product/product_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemTile extends StatelessWidget {
  final String imageUrl;

  const CustomItemTile({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(ProductDetailPage.routeName);
      },
      child: Container(
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
            ]),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                  height: 123,
                  width: 112,
                  errorWidget: (context, url, error) =>
                      Image.asset(ImagePath.placeHolderPath),
                  imageUrl: imageUrl),
              const Expanded(
                child: Column(
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
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.secondaryColor),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                "New",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.secondaryColor),
                              )),
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Location",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.secondaryColor),
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
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.tertiaryTextColor),
                              ))
                        ],
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et. ...",
                        style: TextStyle(
                            fontSize: 13, color: AppColor.tertiaryTextColor),
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
                          Expanded(
                              flex: 1,
                              child: Text(
                                "|",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primaryTextColor),
                              )),
                          Expanded(
                              flex: 4,
                              child: Text(
                                "Sellers name",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.primaryTextColor),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 13,
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
