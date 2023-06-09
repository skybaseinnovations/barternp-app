import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BarterShimmer {
  static Widget bannerShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: Colors.amber,
          height: 114,
          width: Get.width - 60,
        ),
      ),
    );
  }

  static Widget categoryShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: SizedBox(
        height: 152,
        width: 342,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: Colors.amber,
                      height: 90,
                      width: 90,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Container(
                    color: Colors.amber,
                    height: 10,
                    width: 50,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static Widget subCategoryShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 29,
          mainAxisSpacing: 20,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            height: 176,
            width: 156,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color(0xffa8a8a8).withOpacity(0.25),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(-1, 2))
              ],
              color: Colors.amber,
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }

  static Widget productItemShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
        height: 152,
        width: 342,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.amber,
        ),
      ),
    );
  }

  static Widget chatItemShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              child: ClipOval(
                child: Container(
                  height: 106,
                  width: 106,
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              // width: 209,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.amber,
                        width: 150,
                        height: 13,
                      ),
                      Container(
                        color: Colors.amber,
                        width: 80,
                        height: 13,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.amber,
                    width: 300,
                    height: 13,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget productImageShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Center(
        child: Container(
          width: 300,
          height: 290,
          decoration: const BoxDecoration(
            color: AppColor.backgroundGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }

  static Widget commentItemShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Container(
        height: 70,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static Widget similarAdsShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Container(
        height: 200,
        width: 156,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  static Widget searchChatShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      child: Container(
                        height: 106,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      // width: 209,
                      child: Container(
                        color: Colors.amber,
                        height: 12,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
  static Widget selectCategoryItemShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      // width: 209,
                      child: Container(
                        color: Colors.amber,
                        height: 12,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  static Widget notificationItemShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 13,
                  child: ClipOval(
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Flexible(
                  // width: 209,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.amber,
                            width: 150,
                            height: 10,
                          ),
                          Container(
                            color: Colors.amber,
                            width: 80,
                            height: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        color: Colors.amber,
                        width: double.infinity,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget productDetailPageShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 290,
              decoration: const BoxDecoration(
                color: AppColor.backgroundGreyColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // tags details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              width: double.infinity,
              height: 20,
            ),
          ),
          const SizedBox(
            height: 21,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 13,
                      child: ClipOval(
                        child: Container(
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Flexible(
                      // width: 209,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: Colors.amber,
                                width: 150,
                                height: 10,
                              ),
                              Container(
                                color: Colors.amber,
                                width: 80,
                                height: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            color: Colors.amber,
                            width: double.infinity,
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              width: 150,
              height: 20,
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          Center(
            child: Container(
              width: 380,
              height: 150,
              decoration: const BoxDecoration(
                color: AppColor.backgroundGreyColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              width: 150,
              height: 20,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              width: 380,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColor.backgroundGreyColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
