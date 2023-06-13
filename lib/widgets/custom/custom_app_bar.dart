
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BartarAppBar extends StatelessWidget {
  const BartarAppBar({
    super.key,
    this.hasLeading = true,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle,
    this.leadingWidth,
    this.titleTextStyle,
    this.bottom,
    this.bottomOpacity = 1.0,
  });
  final bool hasLeading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool? centerTitle;
  final double? leadingWidth;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;
  final double bottomOpacity;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasLeading
          ?
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
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
      bottom: bottom,
      bottomOpacity: bottomOpacity,
    );
  }
}
