import 'package:barter_app_2023/controllers/dashboard/home_page_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/widgets/custom/custom_bottom_sheet.dart';
import 'package:barter_app_2023/widgets/row/product_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom/custom_app_bar.dart';
import '../../../widgets/custom/custom_textfield.dart';

class SingleCategory extends StatelessWidget {
  SingleCategory({super.key});
  static const String routeName = "/singleCategory";
  final hpc = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGreyColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: BartarAppBar(
                  centerTitle: true,
                  hasLeading: true,
                  leadingWidth: 30,
                  title: Text(
                    "Mobile",
                    style: TextStyle(color: AppColor.primaryTextColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                onSubmitted: (value) {},
                fillColor: AppColor.searchFieldColor,
                prefixIcon: const Icon(Icons.search),
                hint: 'Search',
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "1000 Results found",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => const CustomBottomSheet());
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(
                        Icons.tune,
                        color: AppColor.secondaryTextColor,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      CustomItemTile(imageUrl: hpc.featuredImageUrl[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: hpc.featuredImageUrl.length),
            ],
          ),
        ),
      )),
    );
  }
}
