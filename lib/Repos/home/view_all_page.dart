import 'package:barter_app_2023/controllers/dashboard/home/view_all_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/row/product_item_tile.dart';
import 'package:barter_app_2023/widgets/shimmer/barter_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllPage extends StatelessWidget {
  static const String routeName = "/viewAllPage/";
  final c = Get.find<ViewAllPageController>();
  ViewAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGreyColor,
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BarterAppBar(
              hasLeading: true,
              title: Text(
                c.title.value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            // const SizedBox(
            //   height: 24,
            // ),
            Expanded(
              child: Obx(
                () => c.isLoading.value
                    ? ListView.builder(
                        padding: const EdgeInsets.only(top: 5),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return BarterShimmer.productItemShimmer();
                        },
                      )
                    : ListView.builder(
                        controller: c.scrollController,
                        physics: const ClampingScrollPhysics(),
                        itemCount: c.adsDetail.length + 1,
                        itemBuilder: (context, index) {
                          if (index == c.adsDetail.length) {
                            return c.nextPageUrl.value == null
                                ? Container()
                                : const Center(
                                    child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: AppColor.primaryColor,
                                      strokeWidth: 2,
                                    ),
                                  ));
                          }
                          return CustomItemTile(
                            adsModel: c.adsDetail[index],
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
