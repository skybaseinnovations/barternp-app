import 'package:barter_app_2023/controllers/auth/login_page_controller.dart';
import 'package:barter_app_2023/utils/colors.dart';
import 'package:barter_app_2023/utils/validators.dart';
import 'package:barter_app_2023/widgets/custom/custom_elevated_button.dart';
import 'package:barter_app_2023/widgets/custom/custom_underline_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/image_paths.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/loginPage/";
  final lpc = Get.find<LoginPageController>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Center(
          child: SingleChildScrollView(
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
                                color: Colors.black,
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
                                    fontSize: 14,
                                    color: AppColor.primaryTextColor,
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
                            Form(
                              key: lpc.formKey,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 100,
                                    child: CustomOutlineBorderTextField(
                                      preIconPath: ImagePath.phoneIconPath,
                                      fillColor: AppColor.backgroundGreyColor,
                                      textInputAction: TextInputAction.done,
                                      hint: "+977",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.primaryTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      readOnly: true,
                                      textInputType: TextInputType.number,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Expanded(
                                    child: CustomOutlineBorderTextField(
                                      controller: lpc.phoneFieldController,
                                      fillColor: AppColor.backgroundGreyColor,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.number,
                                      validator: (String? fieldContent) {
                                        return Validators.checkPhoneField(
                                            lpc.phoneFieldController.text);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            const Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "An One Time Password (OTP) will be sent to your phone number",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColor.secondaryTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            Obx(() => CustomElevatedButton(
                                  isLoading: lpc.isLoading.value,
                                  title: "Continue",
                                  onTap: lpc.onSubmit,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
