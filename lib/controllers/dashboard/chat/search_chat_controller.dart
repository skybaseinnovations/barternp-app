import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchChatPageController extends GetxController {
  TextEditingController searchController = TextEditingController();
  onRecentTap() {
    log("===================>>>>>>>> Recent is tapped");
  }

  onClearAllTap() {
    log("===================>>>>>>>> Clear all is tapped");
  }
}
