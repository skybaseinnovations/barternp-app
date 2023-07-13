import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product/create_ads_controller.dart';
import '../../utils/constants/colors.dart';

class CustomFieldsBottomSheet extends StatelessWidget {
  final label;
  final options;
  final controller;
  CustomFieldsBottomSheet({super.key, this.options, this.label, this.controller});

  final c = Get.put(CreateAdsController());
  @override
  Widget build(BuildContext context) {
    // print("here");
    // print(c.fieldsOptions);
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        AppBar(
          elevation: 0,
          backgroundColor: AppColor.backgroundGreyColor,
          centerTitle: true,
          title: const Text(
            "Select Option",
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
                  ),
                ),
                const SizedBox(
                  width: 27,
                )
              ],
            )
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  String labelname = label;
                  String value = options[index];
                  c.labelDataMap[labelname] = value;
                  c.fieldControllers[label]?.text = value;
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Text(
                    options[index],
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
