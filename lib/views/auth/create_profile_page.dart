import 'package:barter_app_2023/controller/auth/create_profile_page_controller.dart';
import 'package:barter_app_2023/utils/colors.dart';
import 'package:barter_app_2023/utils/validators.dart';
import 'package:barter_app_2023/widget/custom/custom_elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/image_paths.dart';
import '../../widget/custom/custom_underline_text_field.dart';

class CreateProfilePage extends StatelessWidget {
  static const String routeName = "/createProfilePage/";
  final cppc = Get.find<CreateProfilePageController>();

  CreateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundGreyColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Form(
              key: cppc.formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          ImagePath.barterLogoPath,
                          colorFilter:
                              const ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn),
                          height: 32,
                        ),
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Create your ',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Profile',
                              style: TextStyle(
                                fontSize: 30,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 51,
                      ),
                      //for name field
                      const Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.primaryTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomOutlineBorderTextField(
                        controller: cppc.nameController,
                        fillColor: AppColor.backgroundGreyColor,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text,
                        validator: Validators.checkFieldEmpty,
                      ),

                      const SizedBox(
                        height: 36,
                      ),
                      //for email field
                      const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.primaryTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomOutlineBorderTextField(
                        controller: cppc.emailController,
                        fillColor: AppColor.backgroundGreyColor,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                        validator: Validators.checkEmailField,
                      ),

                      const SizedBox(
                        height: 36,
                      ),
                      //for phone number field
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
                      CustomOutlineBorderTextField(
                        controller: cppc.phoneNumberController,
                        fillColor: AppColor.backgroundGreyColor,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number,
                        validator: Validators.checkPhoneField,
                      ),

                      const SizedBox(
                        height: 36,
                      ),
                      //for dob field
                      const Text(
                        "Date of Birth",
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
                          SizedBox(
                            width: 70,
                            child: CustomOutlineBorderTextField(
                              hint: "Year",
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: AppColor.secondaryTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                              controller: cppc.yearController,
                              fillColor: AppColor.backgroundGreyColor,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.datetime,
                              validator: Validators.checkFieldEmpty,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 70,
                            child: CustomOutlineBorderTextField(
                              hint: "Month",
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: AppColor.secondaryTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                              controller: cppc.monthController,
                              fillColor: AppColor.backgroundGreyColor,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.datetime,
                              validator: Validators.checkFieldEmpty,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 70,
                            child: CustomOutlineBorderTextField(
                              hint: "Day",
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: AppColor.secondaryTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                              controller: cppc.dayController,
                              fillColor: AppColor.backgroundGreyColor,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.datetime,
                              validator: Validators.checkFieldEmpty,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 65,
                      ),
                      CustomElevatedButton(
                        title: "Continue",
                        onTap: cppc.onSubmit,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
