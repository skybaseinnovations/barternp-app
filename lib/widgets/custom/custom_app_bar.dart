import 'dart:developer';

import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarterAppBar extends StatelessWidget {
  const BarterAppBar({
    super.key,
    this.hasLeading = true,
    this.automaticallyImplyLeading = false,
    this.title,
    this.flexibleSpace,
    this.actions,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = true,
    this.leadingWidth = 24,
    this.titleTextStyle,
    this.bottom,
    this.bottomOpacity = 1.0,
    this.titileSpacing,
  });
  final bool hasLeading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final Widget? flexibleSpace;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool? centerTitle;
  final double? leadingWidth;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;
  final double bottomOpacity;
  final double? titileSpacing;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasLeading
          ? InkWell(
              onTap: () {
                log("Had been called");
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.primaryTextColor,
              ))
          : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actions,
      elevation: 0,
      backgroundColor: backgroundColor ?? AppColor.backgroundGreyColor,
      foregroundColor: foregroundColor,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      titleTextStyle: titleTextStyle,
      titleSpacing: titileSpacing,
      bottom: bottom,
      bottomOpacity: bottomOpacity,
      flexibleSpace: flexibleSpace,
    );
  }
}
