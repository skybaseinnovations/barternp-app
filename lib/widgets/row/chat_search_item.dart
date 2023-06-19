import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  final bool isRead;
  const SearchTile({
    super.key,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
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
                    width: 15,
                  ),
                  const Flexible(
                    // width: 209,
                    child: Text(
                      "Person Name",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColor.primaryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
