import 'package:barter_app_2023/controllers/dashboard/chat/chatting_page_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/custom/custom_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChattingPage extends StatelessWidget {
  static const String routeName = "/chattingPage/";
  final c = Get.find<ChattingPageController>();
  ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BarterAppBar(
              leadingWidth: 24,
              hasLeading: true,
              title: const Text(
                "Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      ChattingTile(
                        text:
                            "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in.",
                        isSend: false,
                      ),
                      ChattingTile(
                        text: "Lorem ipsum dolor sit ",
                        isSend: false,
                        isSuccessiveSend: true,
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      ChattingTile(
                        text: "Lorem ipsum dolor sit amet ",
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      ChattingTile(
                        text:
                            "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in.",
                        isSend: false,
                      ),
                      ChattingTile(
                        text: "Lorem ipsum dolor sit ",
                        isSend: false,
                        isSuccessiveSend: true,
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      Center(
                        child: Text(
                          "Tuesday, June 6",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 0.02,
                            fontWeight: FontWeight.w400,
                            color: AppColor.primaryTextColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ChattingTile(
                        text: "Lorem ipsum dolor sit amet  sit amet ame",
                      ),
                      ChattingTile(
                        text: "Lorem ipsum dolor sit amet ",
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      ChattingTile(
                        text:
                            "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in.",
                        isSend: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: c.onAddTap,
                  child: const Icon(
                    Icons.add,
                    color: AppColor.secondaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: c.onCameraTap,
                  child: SvgPicture.asset(ImagePath.cameraIconIconPath),
                ),
                GestureDetector(
                  onTap: c.onGalleryTap,
                  child: SvgPicture.asset(ImagePath.galleryIconPath),
                ),
                SizedBox(
                  width: Get.size.width * (4 / 7),
                  child: CustomTextField(
                    controller: c.messageEditingController,
                    borderRadius: 16,
                    fillColor: AppColor.searchFieldColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 19, vertical: 5),
                    hint: "Message",
                    hintStyle: const TextStyle(
                      letterSpacing: 0.02,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.tertiaryTextColor,
                    ),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    suffixIconPath: ImagePath.sendMessageIconPath,
                    onSuffixTap: c.onSendMessage,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      )),
    );
  }
}

class ChattingTile extends StatelessWidget {
  final String text;

  final bool isSend;

  final bool isSuccessiveSend;
  const ChattingTile({
    super.key,
    required this.text,
    this.isSend = true,
    this.isSuccessiveSend = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: isSend ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          isSend
              ? Container()
              : isSuccessiveSend
                  ? Container(
                      width: 26,
                    )
                  : CircleAvatar(
                      radius: 13,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          height: 106,
                          width: 106,
                          placeholder: (context, _) => const Center(
                              child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 226, 228, 232),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            constraints: BoxConstraints(maxWidth: Get.size.width / 1.6),
            decoration: BoxDecoration(
              color: isSend ? AppColor.secondaryColor : AppColor.tertiaryTextColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              text,
              style: const TextStyle(
                letterSpacing: 0.02,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
