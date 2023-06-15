import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAdsController extends GetxController {
  final currentStep = 0.obs;

  late List<Step> steps;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    steps = [
      Step(
        
        isActive: currentStep.value <= 0 ? true : false,
        title: const Text("heyy"),
        content: Container(
          height: 200,
          width: 300,
          color: Colors.red,
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep.value == 1 ? true : false,
        title: const Text("2"),
        content: Container(
          height: 200,
          width: 300,
          color: Colors.yellow,
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep.value <= 1 ? true : false,
        title: const Text("3"),
        content: Container(
          height: 200,
          width: 300,
          color: Colors.green,
        ),
      ),
    ];
  }
}
