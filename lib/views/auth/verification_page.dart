import 'package:barter_app_2023/controllers/auth/verification_page_controller.dart';
import 'package:barter_app_2023/utils/colors.dart';
import 'package:barter_app_2023/utils/validators.dart';
import 'package:barter_app_2023/widgets/custom/custom_elevated_button.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../utils/image_paths.dart';

class VerificationPage extends StatelessWidget {
  static const String routeName = "/verificationPage/";
  final vpc = Get.find<VerificationPageController>();

  VerificationPage({super.key});

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
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //for country
                            const Text(
                              "Verify your Phone Number",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: const Text(
                                textAlign: TextAlign.center,
                                "Please enter the OTP sent to your Phone Number +97798456*****",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColor.secondaryTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 45,
                            ),
                            Form(
                              key: vpc.formKey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                child: Pinput(
                                    followingPinTheme: const PinTheme(
                                      width: 50,
                                      height: 55,
                                      textStyle: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      padding: EdgeInsets.only(bottom: 5),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: AppColor.secondaryTextColor,
                                            // strokeAlign: 3.0,
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                    ),
                                    controller: vpc.verificationNumberController,
                                    // autofocus: true,
                                    length: 5,
                                    defaultPinTheme: const PinTheme(
                                      width: 50,
                                      height: 55,
                                      textStyle: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      padding: EdgeInsets.only(bottom: 5),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: AppColor.secondaryColor,
                                            // strokeAlign: 3.0,
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                    ),
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    validator: Validators.checkPinField),
                              ),
                            ),

                            const SizedBox(
                              height: 45,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Didn’t get a code? ",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColor.secondaryTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Resend',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColor.primaryTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = vpc.onResend),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 45,
                            ),
                            Obx(
                              () => CustomElevatedButton(
                                isLoading: vpc.isLoading.value,
                                title: "Verify",
                                onTap: vpc.onSubmit,
                              ),
                            ),
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