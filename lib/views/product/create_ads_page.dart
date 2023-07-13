import 'dart:io';

import 'package:barter_app_2023/controllers/image_picker_controller.dart';
import 'package:barter_app_2023/controllers/product/create_ads_controller.dart';
import 'package:barter_app_2023/models/fields_model.dart';
import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:barter_app_2023/widgets/custom/custom_app_bar.dart';
import 'package:barter_app_2023/widgets/custom/custom_category_bottom_sheet.dart';
import 'package:barter_app_2023/widgets/custom/custom_fields_bottom_sheet.dart';
import 'package:barter_app_2023/widgets/custom/custom_underline_text_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/constants/image_paths.dart';
import '../../utils/helpers/validators.dart';
import '../../widgets/custom/custom_snackbar.dart';
import '../../widgets/custom/custom_sub_category_bottom.dart';

class CreateAdsPage extends StatelessWidget {
  CreateAdsPage({Key? key}) : super(key: key);

  static const String routeName = "/createAdsPage";

  final c = Get.find<CreateAdsController>();
  final ipc = Get.find<ImagePickerController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 43,
                  width: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(AppColor.tertiaryTextColor)),
                      onPressed: () {
                        if (c.currentStep.value > 0) {
                          c.currentStep.value--;
                        } else {
                          Get.back();
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
                          backgroundColor: MaterialStatePropertyAll(AppColor.primaryColor)),
                      onPressed: () {
                        if (c.currentStep.value == 0) {
                          if (c.onSubmit()) {
                            c.currentStep.value++;
                          }
                        } else if (c.currentStep.value == 1) {
                          if (ipc.images.length >= 2 || ipc.editImages.length >= 2) {
                            c.fetchFieldsData();
                            c.currentStep.value++;
                          } else {
                            BarterSnackBar.error(
                                message: "You must post at least 2 ads per post.",
                                title: "Photo limit not reached");
                          }
                        } else if (c.currentStep.value == 2) {
                          if (c.onNext()) {
                            c.isLoading.value = true;
                            c.getLocation();
                            c.postAds(context);

                            // c.currentStep.value++;
                          }
                          // c.fetchFieldsData();
                        }
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: AppColor.backgroundGreyColor,
        body: SafeArea(
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 24, right: 24),
                  child: BarterAppBar(
                    centerTitle: true,
                    hasLeading: true,
                    leadingWidth: 30,
                    title: const Text(
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

                    // onStepTapped: (value) {
                    //   c.currentStep.value = value;

                    // },
                    controlsBuilder: (context, details,
                        {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
                      return Container();
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
                          child: Form(
                            key: c.formKey,
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
                                SizedBox(
                                  height: 50,
                                  child: CustomOutlineBorderTextField(
                                      controller: c.titleFieldController,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      validator: Validators.checkFieldEmpty),
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
                                SizedBox(
                                  height: 50,
                                  child: CustomOutlineBorderTextField(
                                      controller: c.descriptionFieldController,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      validator: Validators.checkFieldEmpty),
                                ),
                                const SizedBox(
                                  height: 38,
                                ),
                                const Text(
                                  "Price",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: CustomOutlineBorderTextField(
                                      controller: c.priceFieldController,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.number,
                                      validator: Validators.checkFieldEmpty),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Category",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomOutlineBorderTextField(
                                    onTap: () {
                                      c.subCategoryFieldController.clear();
                                      showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(top: Radius.circular(16))),
                                          context: context,
                                          builder: (context) =>
                                              SizedBox(child: CustomCategoryBottomSheet()));
                                    },
                                    color: Colors.transparent,
                                    suffixIconPath: ImagePath.downArrowconPath,
                                    controller: c.categoryFieldController,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.none,
                                    readOnly: true,
                                    hintStyle: const TextStyle(color: Colors.black),
                                    validator: Validators.checkFieldEmpty),
                                const SizedBox(
                                  height: 38,
                                ),
                                c.hasSub.value
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Subcategory",
                                            style: TextStyle(fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomOutlineBorderTextField(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.vertical(
                                                          top: Radius.circular(16))),
                                                  context: context,
                                                  builder: (context) => SizedBox(
                                                      child: CustomSubCategoryBottomSheet()));
                                            },
                                            suffixIconPath: ImagePath.downArrowconPath,
                                            controller: c.subCategoryFieldController,
                                            textInputAction: TextInputAction.next,
                                            textInputType: TextInputType.none,
                                            readOnly: true,
                                            validator: Validators.checkFieldEmpty,
                                            hintStyle: const TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      )
                                    : const SizedBox()
                              ],
                            ),
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
                                    itemCount: ipc.isEdit.value
                                        ? ipc.editImages.length
                                        : ipc.images.length,
                                    itemBuilder: (context, index) {
                                      return badges.Badge(
                                        onTap: () {
                                          ipc.deleteImage(index);
                                        },
                                        position:
                                            badges.BadgePosition.bottomStart(bottom: 98, start: 75),
                                        badgeStyle: const badges.BadgeStyle(
                                            badgeColor: AppColor.tertiaryTextColor),
                                        badgeContent: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                        child: Obx(() {
                                          if (ipc.isEdit.value) {
                                            try {
                                              return ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: CachedNetworkImage(
                                                  height: 90,
                                                  width: 90,
                                                  fit: BoxFit.cover,
                                                  imageUrl: ipc.editImages[index],
                                                  errorWidget: (context, url, error) => Image.file(
                                                    File(ipc.editImages[index]),
                                                    fit: BoxFit.cover,
                                                    height: 90,
                                                    width: 90,
                                                  ),
                                                ),
                                              );
                                            } catch (e) {
                                              // Handle the error, if needed
                                              print('Error loading image from network: $e');
                                            }
                                          }

                                          return ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.file(
                                              File(ipc.displayImage[index]),
                                              fit: BoxFit.cover,
                                              height: 90,
                                              width: 90,
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ),
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
                          content: Obx(() => c.isLoading.value
                              ? const CircularProgressIndicator()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Feature this ad ",
                                              style: TextStyle(fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10.0),
                                              child: Text(
                                                  "Featuring the ad will increase the ads reach"),
                                            )
                                          ],
                                        ),
                                        Switch(
                                            value: c.isFeatured.value,
                                            onChanged: (value) {
                                              c.isFeatured.value = value;
                                              if (c.isFeatured.value) {
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return const AlertDialog();
                                                    });
                                              }
                                            })
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Form(
                                      key: c.fieldsFormKey,
                                      child: ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: c.fieldsData.length,
                                        itemBuilder: (context, index) {
                                          FieldDetails fieldDetail = c.fieldsData[index];
                                          Widget widget =
                                              createFieldsWithType(fieldDetail, context);
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 20.0),
                                            child: widget,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ))),
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

  createFieldsWithType(FieldDetails fieldDetails, BuildContext context) {
    switch (fieldDetails.type) {
      case 'TEXT':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldDetails.label!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 50,
              child: CustomOutlineBorderTextField(
                controller: c.fieldControllers[fieldDetails.label!],
                textInputAction: TextInputAction.next,
                validator: fieldDetails.required == 1 ? Validators.checkFieldEmpty : null,
                textInputType: TextInputType.text,
              ),
            ),
          ],
        );

      case 'TEXT_NUMBER':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldDetails.label!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 50,
              child: InkWell(
                child: CustomOutlineBorderTextField(
                  controller: c.fieldControllers[fieldDetails.label!],
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  validator: fieldDetails.required == 1
                      ? fieldDetails.label == "Contact no."
                          ? Validators.checkPhoneField
                          : Validators.checkFieldEmpty
                      : null,
                ),
              ),
            ),
          ],
        );

      case 'SELECT':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldDetails.label!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomOutlineBorderTextField(
              controller: c.fieldControllers[fieldDetails.label!],
              onTap: () {
                // print(c.fieldControllers[fieldDetails.label!]);
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                    context: context,
                    builder: (context) => SizedBox(
                            child: CustomFieldsBottomSheet(
                          options: fieldDetails.options,
                          label: fieldDetails.label,
                        )));
              },
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.none,
              color: Colors.transparent,
              suffixIconPath: ImagePath.downArrowconPath,
              validator: fieldDetails.required == 1 ? Validators.checkFieldEmpty : null,
              readOnly: true,
            )
          ],
        );
    }
  }
}
