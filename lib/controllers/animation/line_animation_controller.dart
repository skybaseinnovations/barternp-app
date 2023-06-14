import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlideAnimation extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  initialize() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    animation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0)).animate(animationController);
  }
}
