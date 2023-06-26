import 'package:barter_app_2023/controllers/dashboard/profile/edit_profile_page_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/utils/constants/image_paths.dart';
import 'package:barter_app_2023/utils/helpers/validators.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/custom/custom_elevated_button.dart';
import 'package:barter_app_2023/widgets/custom/custom_underline_text_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  static const String routeName = "/editProfilePage/";
  final c = Get.find<EditProfilePageController>();

  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundGreyColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
          child: Form(
            key: c.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BarterAppBar(
                    leadingWidth: 24,
                    title: Text(
                      "My Profile",
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
                  Center(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            c.showImagePicker(context);
                          },
                          child: ClipOval(
                            child: Obx(
                              () => c.imageFile.value != null
                                  ? SizedBox(
                                      height: 122,
                                      width: 122,
                                      child: Image.file(
                                        c.imageFile.value!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : CachedNetworkImage(
                                      height: 122,
                                      width: 122,
                                      errorWidget: (context, url, error) =>
                                          Image.asset(ImagePath.defaultAvatar),
                                      placeholder: (context, url) =>
                                          Image.asset(ImagePath.defaultAvatar),
                                      imageUrl: c.initialImageUrl,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 13,
                          child: GestureDetector(
                            onTap: () {
                              c.showImagePicker(context);
                            },
                            child: SvgPicture.asset(ImagePath.editImageIconPath),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 57,
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
                    height: 5,
                  ),
                  CustomOutlineBorderTextField(
                    controller: c.nameController,
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
                    height: 5,
                  ),
                  CustomOutlineBorderTextField(
                    controller: c.emailController,
                    fillColor: AppColor.backgroundGreyColor,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.checkEmailField,
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
                    height: 5,
                  ),
                  CustomOutlineBorderTextField(
                      onTap: () => c.selectDate(context),
                      readOnly: true,
                      controller: c.dateOfBirthController,
                      fillColor: AppColor.backgroundGreyColor,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.datetime,
                      validator: (value) {
                        value!.trim();
                        if (value.isEmpty) {
                          return 'Please select Date of Birth';
                        }

                        return null;
                      }),

                  const SizedBox(
                    height: 36,
                  ),
                  //for dob field
                  const Text(
                    "Gender",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(() => DropDownTextField(
                        clearOption: c.clearOption.value,
                        controller: c.genderController,
                        readOnly: true,
                        dropdownRadius: 4,
                        textFieldFocusNode: c.dropdownFieldFocusNode,
                        dropDownIconProperty: IconProperty(
                            icon: c.hasFocus.value
                                ? Icons.keyboard_arrow_up_sharp
                                : Icons.keyboard_arrow_down_outlined),
                        dropDownList: const [
                          DropDownValueModel(name: "Unspecified", value: "Unspecified"),
                          DropDownValueModel(name: "Male", value: "Male"),
                          DropDownValueModel(name: "Female", value: "Female"),
                          DropDownValueModel(name: "Other", value: "Other"),
                        ],
                      )),

                  const SizedBox(
                    height: 100,
                  ),
                  Obx(() => CustomElevatedButton(
                        isLoading: c.isLoading.value,
                        title: "Save",
                        onTap: c.onSubmit,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
