import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingPageController extends GetxController {
  var messageEditingController = TextEditingController();
  onAddTap() {
    log("========================>>>>>> plus is tapped");
  }

  onGalleryTap() {
    log("========================>>>>>> gallery is tapped");
  }

  onCameraTap() {
    log("========================>>>>>> camera is tapped");
  }

  onSendMessage() {
    log("========================>>>>>> message is sent");
  }
}
