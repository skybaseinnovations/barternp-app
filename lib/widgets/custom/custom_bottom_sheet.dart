import 'package:barter_app_2023/utils/constants/colors.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_filter_buttons.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(26))),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: const Text(
                  "Filter Ads",
                  style: TextStyle(
                      color: AppColor.primaryTextColor, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                actions: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColor.primaryTextColor,
                          )),
                      const SizedBox(
                        width: 27,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 30,
              thickness: 1,
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(
                  title: "Category",
                ),
                FilterButton(
                  title: "Location",
                ),
                FilterButton(
                  title: "Condition",
                ),
              ],
            ),
            const SizedBox(
              height: 41,
            ),
            const Text(
              "Category",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 13,
            ),
            DropDownTextField(
              // clearOption: c.clearOption.value,
              // controller: c.genderController,
              readOnly: true,
              dropdownRadius: 4,
              dropDownIconProperty: IconProperty(icon: Icons.expand_more, size: 25),
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
              height: 30,
            ),
            const Text(
              "Location",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 13,
            ),
            DropDownTextField(
              // clearOption: c.clearOption.value,
              // controller: c.genderController,
              readOnly: true,
              dropdownRadius: 4,
              dropDownIconProperty: IconProperty(icon: Icons.location_on_outlined, size: 25),
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
              height: 30,
            ),
            const Text(
              "Condition",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 13,
            ),





         
            DropDownTextField(
              // clearOption: c.clearOption.value,
              // controller: c.genderController,
              readOnly: true,
              dropdownRadius: 4,
              dropDownIconProperty: IconProperty(icon: Icons.expand_more, size: 25),
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
              height: 60,
            ),
            const Divider(
              height: 30,
              thickness: 1,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const InkWell(
                    child: Text(
                      "Clear all",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "Apply",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
