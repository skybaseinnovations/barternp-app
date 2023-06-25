import 'package:barter_app_2023/models/ads_model.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class SimilarAdsWidget extends StatelessWidget {
  final AdsDetail similarAds;
  const SimilarAdsWidget({
    super.key,
    required this.similarAds,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 156,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            similarAds.title!,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColor.primaryTextColor,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "Rs ${similarAds.price}",
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
