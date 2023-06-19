import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class SimilarAdsWidget extends StatelessWidget {
  const SimilarAdsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 156,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
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
          const Text(
            "iPhone 14 plus",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColor.primaryTextColor,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            "Rs 120,000",
            style: TextStyle(
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
