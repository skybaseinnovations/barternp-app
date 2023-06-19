import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final bool isRead;
  final bool showDate;
  final VoidCallback? onTap;
  const NotificationTile({
    super.key,
    this.isRead = false,
    this.showDate = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showDate
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "11th June 2023",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
              )
            : Container(),
        InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
            color: isRead ? AppColor.secondaryColor.withOpacity(0.1) : Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
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
                  width: 14,
                ),
                const Flexible(
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
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primaryTextColor,
                              ),
                            ),
                          ),
                          Text("2 mins",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: AppColor.tertiaryTextColor,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit",
                        style: TextStyle(
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
        ),
      ],
    );
  }
}
