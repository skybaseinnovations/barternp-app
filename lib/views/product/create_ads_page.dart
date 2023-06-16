import 'dart:io';

import 'package:barter_app_2023/controllers/dashboard/home_page_controller.dart';
import 'package:barter_app_2023/controllers/image_picker_controller.dart';
import 'package:barter_app_2023/controllers/product/create_ads_controller.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/custom/custom_underline_text_field.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class CreateAdsPage extends StatelessWidget {
  CreateAdsPage({Key? key}) : super(key: key);

  static const String routeName = "/createAdsPage";
  final hpc = Get.find<HomePageController>();
  final c = Get.put(CreateAdsController());
  final ipc = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundGreyColor,
        body: SafeArea(
          child: Obx(
            () => Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 24, right: 24),
                  child: BartarAppBar(
                    centerTitle: true,
                    hasLeading: true,
                    leadingWidth: 30,
                    title: Text(
                      "New Ad",
                      style: TextStyle(color: AppColor.primaryTextColor),
                    ),
                  ),
                ),
                Expanded(
                  child: Stepper(
                    type: StepperType.horizontal,
                    elevation: 0,
                    currentStep: c.currentStep.value,
                    onStepTapped: (value) {
                      c.currentStep.value = value;
                    },
                    controlsBuilder: (context, details,
                        {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 43,
                            width: 110,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(AppColor.tertiaryTextColor)),
                                onPressed: () {
                                  if (c.currentStep.value > 0) {
                                    c.currentStep.value--;
                                  }
                                },
                                child: const Text('Back'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 43,
                            width: 110,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(AppColor.primaryColor)),
                                onPressed: () {
                                  if (c.currentStep.value < c.steps.length - 1) {
                                    c.currentStep.value++;
                                  }
                                },
                                child: const Text('Next'),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    steps: [
                      Step(
                        state: c.currentStep > 0 ? StepState.complete : StepState.indexed,
                        isActive: c.currentStep.value <= -1 ? false : true,
                        label: const Text(
                          "Details",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        title: const Text(""),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              const Text(
                                "Ad Title",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 50,
                                child: CustomOutlineBorderTextField(
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text),
                              ),
                              const SizedBox(
                                height: 38,
                              ),
                              const Text(
                                "Ad Description",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              const SizedBox(
                                height: 50,
                                child: CustomOutlineBorderTextField(
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text),
                              ),
                              const SizedBox(
                                height: 38,
                              ),
                              const Text(
                                "Price",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DropDownTextField(
                                // clearOption: c.clearOption.value,
                                // controller: c.genderController,
                                readOnly: true,
                                dropdownRadius: 4,
                                dropDownIconProperty:
                                    IconProperty(icon: Icons.expand_more, size: 25),
                                // textFieldFocusNode: c.dropdownFieldFocusNode,
                                // dropDownIconProperty: IconProperty(
                                //     icon: c.hasFocus.value
                                //         ? Icons.keyboard_arrow_up_sharp
                                //         : Icons.keyboard_arrow_down_outlined),
                                dropDownList: const [
                                  // DropDownValueModel(name: "Unspecified", value: "Unspecified"),
                                  // DropDownValueModel(name: "Male", value: "Male"),
                                  // DropDownValueModel(name: "Female", value: "Female"),
                                  // DropDownValueModel(name: "Other", value: "Other"),
                                ],
                              ),
                              const SizedBox(
                                height: 38,
                              ),
                              const Text(
                                "Subcategory",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DropDownTextField(
                                // clearOption: c.clearOption.value,
                                // controller: c.genderController,
                                readOnly: true,
                                dropdownRadius: 4,
                                dropDownIconProperty:
                                    IconProperty(icon: Icons.expand_more, size: 25),
                                // textFieldFocusNode: c.dropdownFieldFocusNode,
                                // dropDownIconProperty: IconProperty(
                                //     icon: c.hasFocus.value
                                //         ? Icons.keyboard_arrow_up_sharp
                                //         : Icons.keyboard_arrow_down_outlined),
                                dropDownList: const [
                                  // DropDownValueModel(name: "Unspecified", value: "Unspecified"),
                                  // DropDownValueModel(name: "Male", value: "Male"),
                                  // DropDownValueModel(name: "Female", value: "Female"),
                                  // DropDownValueModel(name: "Other", value: "Other"),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              )
                            ],
                          ),
                        ),
                      ),
                      Step(
                          state: c.currentStep > 1 ? StepState.complete : StepState.indexed,
                          isActive: c.currentStep.value <= 0 ? false : true,
                          title: const Text(""),
                          label: const Text(
                            "Images",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          content: SingleChildScrollView(
                            child: Column(mainAxisSize: MainAxisSize.min, children: [
                              const SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) => Container(
                                            height: 125,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(15),
                                                    topRight: Radius.circular(15))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 24.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      ipc.pickImage(ImageSource.camera);
                                                    },
                                                    child: const Row(
                                                      children: [
                                                        Icon(Icons.camera_alt_outlined),
                                                        Text("Take a photo")
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      ipc.pickImage(ImageSource.gallery);
                                                    },
                                                    child: const Row(
                                                      children: [
                                                        Icon(Icons.image_outlined),
                                                        Text("Add from gallery")
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ));
                                },
                                child: DottedBorder(
                                    color: AppColor.tertiaryTextColor, //color of dotted/dash line
                                    strokeWidth: 2,
                                    dashPattern: const [8],
                                    child: const SizedBox(
                                      //color of dotted/dash line
                                      height: 120,
                                      width: 342,
                                      child: Icon(
                                        Icons.image_outlined,
                                        color: AppColor.tertiaryTextColor,
                                        size: 100,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Obx(
                                () => SizedBox(
                                  height: 300,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 4,
                                      mainAxisSpacing: 4,
                                    ),
                                    itemCount: ipc.images.length,
                                    itemBuilder: (context, index) {
                                      return badges.Badge(
                                        onTap: () {
                                          ipc.deleteImage(index);
                                        },
                                        position: badges.BadgePosition.bottomStart(
                                            bottom: 100, start: 70),
                                        badgeStyle: const badges.BadgeStyle(
                                            badgeColor: AppColor.tertiaryTextColor),
                                        badgeContent: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.file(
                                            File(ipc.images[index]),
                                            fit: BoxFit.cover,
                                            height: 90,
                                            width: 90,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              // Row(
                              //   children: [
                              //     badges.Badge(
                              //         badgeStyle: const badges.BadgeStyle(
                              //             badgeColor: AppColor.tertiaryTextColor),
                              //         badgeContent: const Icon(
                              //           Icons.close,
                              //           color: Colors.white,
                              //           size: 12,
                              //         ),
                              //         child: ClipRRect(
                              //             borderRadius: BorderRadius.circular(8),
                              //             child: Image.asset(ImagePath.iphonePhoto))),
                              //   ],
                              // ),
                            ]),
                          )),
                      Step(
                        state: c.currentStep > 2 ? StepState.complete : StepState.indexed,
                        isActive: c.currentStep.value <= 1 ? false : true,
                        title: const Text(""),
                        label: const Text(
                          "Additional",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        content: Container(
                          height: Get.height,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
