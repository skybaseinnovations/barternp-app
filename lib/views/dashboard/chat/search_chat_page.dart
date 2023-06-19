import 'package:barter_app_2023/controllers/dashboard/chat/search_chat_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_paths.dart';
import '../../../widgets/custom/custom_textfield.dart';
import '../../../widgets/row/chat_search_item.dart';

class SearchChatPage extends StatelessWidget {
  static const String routeName = "/searchChatPage/";
  final c = Get.find<SearchChatPageController>();
  SearchChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
            child: BartarAppBar(
              hasLeading: true,
              titileSpacing: 0,
              title: CustomTextField(
                  borderRadius: 16,
                  controller: c.searchController,
                  fillColor: AppColor.searchFieldColor,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColor.secondaryTextColor,
                  ),
                  hint: 'Search',
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: AppColor.tertiaryTextColor,
            thickness: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: c.onRecentTap,
                      child: const Text(
                        "Recent",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryTextColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: c.onClearAllTap,
                      child: const Text(
                        "Clear All",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryTextColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SearchTile(),
                const SearchTile(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
