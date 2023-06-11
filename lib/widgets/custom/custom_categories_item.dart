import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCategoriesItem extends StatelessWidget {
  final String imageName;
  final String categoryName;
  const CustomCategoriesItem({
    required this.imageName,
    required this.categoryName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: 90,
              width: 90,
              errorWidget: (context, url, error) => Image.asset(ImagePath.placeHolderPath),
              imageUrl: imageName),
        ),
        // ignore: prefer_const_constructors
        Text(
          categoryName,
          style: const TextStyle(
            fontSize: 13,
          ),
        )
      ],
    );
  }
}
