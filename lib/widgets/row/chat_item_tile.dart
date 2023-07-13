import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/image_paths.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Person Name",
                          overflow: TextOverflow.ellipsis,
                          style: isRead
                              ? const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.secondaryTextColor,
                                )
                              : const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primaryTextColor,
                                ),
                        ),
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
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur adipiscing elit",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: isRead
                        ? const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.secondaryTextColor,
                          )
                        : const TextStyle(
                            fontSize: 12,
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
    );
  }
}
