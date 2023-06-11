import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class ProductDetailPageController extends GetxController {
  CarouselController buttonCarouselController = CarouselController();
  var photoIndex = 1.obs;
  var productImage = [
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
  ];
  onChatTap() {
    log("================>>>> chat field is tapped");
  }

  onCallTap() {
    log("================>>>> call field is tapped");
  }
}
