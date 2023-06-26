import 'package:barter_app_2023/controllers/core_controller.dart';
import 'package:barter_app_2023/models/ads_model.dart';
import 'package:barter_app_2023/models/comment_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_paths.dart';

class CommentListTile extends StatelessWidget {
  final CommentsModel? comment;
  final VoidCallback onLongTap;
  final cc = Get.find<CoreController>();
  CommentListTile({
    required this.comment,
    required this.onLongTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (cc.currentUser.value!.id == comment!.userId) {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    "Do you want to delete?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel',
                          style: TextStyle(
                            color: AppColor.secondaryTextColor,
                          )),
                    ),
                    TextButton(
                      onPressed: onLongTap,
                      child: const Text('OK',
                          style: TextStyle(
                            color: Colors.red,
                          )),
                    ),
                  ],
                );
              });
        } else {
          return;
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20, right: 10, left: 10),
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              color: const Color(0xff9F9F9F).withOpacity(.25),
              offset: const Offset(-1, 2),
              spreadRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              child: ClipOval(
                child: CachedNetworkImage(
                  height: 106,
                  width: 106,
                  placeholder: (context, _) => Image.asset(
                    ImagePath.defaultAvatar,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    ImagePath.defaultAvatar,
                  ),

                  //comment avatar halnu xa
                  imageUrl: comment!.commentator!.avatarUrl!,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          comment!.commentator!.name!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.primaryTextColor,
                          ),
                        ),
                      ),
                      Text(
                        AdsDetail.returnDate(comment!.createdAt!),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColor.tertiaryTextColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    comment!.comment!,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: AppColor.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
