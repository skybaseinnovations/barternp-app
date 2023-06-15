import 'package:barter_app_2023/controllers/dashboard/chat/chat_page_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/views/dashboard/chat/chatting_page.dart';
import 'package:barter_app_2023/views/dashboard/chat/search_chat_page.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom/custom_tab_bar.dart';

class ChatPage extends StatelessWidget {
  final c = Get.find<ChatPageController>();
  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BartarAppBar(
            hasLeading: false,
            title: const Text(
              "Chat",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => Get.toNamed(SearchChatPage.routeName),
                child: const Icon(
                  Icons.search,
                  color: AppColor.primaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 34,
          ),
          SizedBox(
            width: Get.width / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => CustomTabBar(
                    animation: Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
                        .animate(c.tabAnimationController.animationController),
                    title: 'Buying',
                    onTap: () {
                      c.tabAnimationController.animationController.reverse();
                      c.showFeaturedPage();
                    },
                    isActive: c.currentIndex.value == 0,
                  ),
                ),
                Obx(
                  () => CustomTabBar(
                    animation: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                        .animate(c.tabAnimationController.animationController),
                    title: 'Selling',
                    onTap: () {
                      c.tabAnimationController.animationController.forward();
                      c.showNearbyAds();
                    },
                    isActive: c.currentIndex.value == 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          // Obx(
          //   () => ,
          // ),
          Expanded(
            child: PageView(
              key: const PageStorageKey(1),
              padEnds: false,
              physics: const BouncingScrollPhysics(),
              controller: c.pageController,
              allowImplicitScrolling: true,
              onPageChanged: (int index) {
                if (index == 0) {
                  c.tabAnimationController.animationController.reverse();
                  c.currentIndex.value = index;
                } else {
                  c.tabAnimationController.animationController.forward();
                  c.currentIndex.value = index;
                }
              },
              children: [
                ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (index == 1) {
                        return ChatTile(
                          isRead: true,
                          onTap: () {
                            Get.toNamed(ChattingPage.routeName);
                          },
                        );
                      }
                      return ChatTile(
                        onTap: () {
                          Get.toNamed(ChattingPage.routeName);
                        },
                      );
                    },
                    itemCount: 3),
                ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return const ChatTile();
                    },
                    itemCount: 3),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class ChatTile extends StatelessWidget {
  final bool isRead;
  final VoidCallback? onTap;
  const ChatTile({
    super.key,
    this.isRead = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    child: ClipOval(
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
                        imageUrl: "https://picsum.photos/200/300",
                        fit: BoxFit.cover,
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
                        Text(
                          "Person Name",
                          style: isRead
                              ? const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.secondaryTextColor,
                                )
                              : const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primaryTextColor,
                                ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet consectetur adipiscing elit",
                          style: isRead
                              ? const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.secondaryTextColor,
                                )
                              : const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.secondaryTextColor,
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "2 days ago",
              style: isRead
                  ? const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColor.tertiaryTextColor,
                    )
                  : const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColor.tertiaryTextColor,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
