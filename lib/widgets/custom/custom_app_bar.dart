import 'package:barter_app_2023/utils/colors.dart';
import 'package:flutter/material.dart';

class BartarAppBar extends StatelessWidget {
  BartarAppBar({
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
  });
  bool hasLeading;
  bool automaticallyImplyLeading = true;
  Widget? title;
  List<Widget>? actions;
  double? elevation;
  Color? backgroundColor;
  Color? foregroundColor;
  bool? centerTitle;
  double? leadingWidth;
  TextStyle? titleTextStyle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasLeading
          ? const Icon(
              Icons.arrow_back_ios,
              color: AppColor.primaryTextColor,
            )
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
    );
  }
}
