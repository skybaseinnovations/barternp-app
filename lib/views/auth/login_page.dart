import 'package:barter_app_2023/controller/auth/login_page_controller.dart';
import 'package:barter_app_2023/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../utils/image_paths.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/loginPage/";
  // final lpc = Get.find<LoginPageController>();
  final LoginPageController lpc = Get.put(LoginPageController());
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              //get 30% of screen
              height: Get.height / (10 / 3),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: 40,
                    child: SvgPicture.asset(ImagePath.barterLogoPath),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  //get 70% of screen
                  height: Get.height / (10 / 7),
                  decoration: const BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(48))),
                ),
                Container(
                  width: double.infinity,

                  //get 70% of screen
                  height: Get.height / (10 / 7) - 19,
                  decoration: const BoxDecoration(
                    color: AppColor.backgroundGreyColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(36),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //for country
                        const Text(
                          "Country",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(ImagePath.nepalFlagPath),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Nepal",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: AppColor.tertiaryTextColor,
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 31,
                        ),

                        //for phone number
                        const Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.primaryTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(ImagePath.phoneIconPath),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Text(
                                      "+977",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.primaryTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  color: AppColor.tertiaryTextColor,
                                  height: 1,
                                  width: 85,
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  TextFormField(
                                    cursorColor: AppColor.tertiaryTextColor,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColor.primaryTextColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    controller: lpc.phoneFieldController,
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: AppColor.tertiaryTextColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: AppColor.tertiaryTextColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        const Center(
                          child: Text(
                            "A 4 digit code will be sent to your phone number",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColor.secondaryTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 52,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              minimumSize: const Size.fromHeight(50),
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              elevation: 0),
                          onPressed: () {},
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
