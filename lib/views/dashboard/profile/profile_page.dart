import 'dart:developer';

import 'package:barter_app_2023/controllers/core_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/views/auth/login_page.dart';
import 'package:barter_app_2023/views/dashboard/profile/edit_profile_page.dart';
import 'package:barter_app_2023/views/dashboard/profile/like_ads_page.dart';
import 'package:barter_app_2023/views/dashboard/profile/notification_page.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/custom/custom_snackbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/profilePage/";
  final cc = Get.find<CoreController>();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BarterAppBar(
                hasLeading: false,
                title: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 41,
              ),
              ClipOval(
                child: Obx(
                  () => CachedNetworkImage(
                    height: 122,
                    width: 122,
                    errorWidget: (context, url, error) => Image.asset(ImagePath.defaultAvatar),
                    placeholder: (context, url) => Image.asset(ImagePath.defaultAvatar),
                    imageUrl: cc.currentUser.value!.avatarUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Obx(() => Text(
                    "${cc.currentUser.value!.name}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )),
              const SizedBox(
                height: 4,
              ),
              Obx(() => Text(
                    "${cc.currentUser.value!.phone}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.secondaryTextColor,
                    ),
                  )),
              const SizedBox(
                height: 44,
              ),
              ProfileListTile(
                icon: ImagePath.myProfileIconPath,
                title: "My Profile",
                action: () {
                  Get.toNamed(EditProfilePage.routeName);
                },
              ),
              const SizedBox(
                height: 36,
              ),
              ProfileListTile(
                icon: ImagePath.likedAdsIconPath,
                title: "Liked Ads",
                action: () {
                  Get.toNamed(LikedAds.routeName);
                },
              ),
              const SizedBox(
                height: 36,
              ),
              ProfileListTile(
                icon: ImagePath.notificationIconPath,
                title: "Notifications",
                action: () {
                  Get.toNamed(NotificationPage.routeName);
                },
              ),
              const SizedBox(
                height: 36,
              ),
              ProfileListTile(
                icon: ImagePath.aboutIconPath,
                title: "About",
                action: () {},
              ),
              const SizedBox(
                height: 36,
              ),
              ProfileListTile(
                icon: ImagePath.termsAndConditionIconPath,
                title: "Terms and conditions",
                action: () {},
              ),
              const SizedBox(
                height: 36,
              ),
              ProfileListTile(
                icon: ImagePath.logoutIconPath,
                title: "Logout",
                isLogOut: true,
                action: () {
                  cc.loggedOut();
                  BarterSnackBar.success(
                      title: "Log out Successful", message: "You have logged out of your account");
                  Get.offAllNamed(LoginPage.routeName);
                  log("==============loggout clicked");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    this.isLogOut = false,
    required this.action,
  });
  final String icon;
  final String title;
  final bool isLogOut;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: action,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isLogOut ? const Color(0xffF8385B) : AppColor.primaryTextColor,
                ),
              )
            ],
          ),
          isLogOut
              ? Container()
              : const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.secondaryTextColor,
                ),
        ],
      ),
    );
  }
}
