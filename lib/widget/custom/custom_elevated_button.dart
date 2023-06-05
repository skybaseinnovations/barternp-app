import 'package:barter_app_2023/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double height;
  final bool isDisabled;
  final Color? backGroundColor;
  final Color? textColor;
  const CustomElevatedButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.height = 50,
      this.isDisabled = false,
      this.backGroundColor = AppColor.tertiaryTextColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            minimumSize: Size.fromHeight(height),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: isDisabled ? null : onTap,
        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
