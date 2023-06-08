import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class ProductDetailPageController extends GetxController {
  CarouselController buttonCarouselController = CarouselController();
  var photoIndex = 1.obs;
  var productImage = [
    "https://pbs.twimg.com/media/FxhrKS5WcAEGFHn?format=jpg&name=4096x4096",
    "https://pbs.twimg.com/media/FxhrKS5WcAEGFHn?format=jpg&name=4096x4096",
    "https://pbs.twimg.com/media/FxhrKS5WcAEGFHn?format=jpg&name=4096x4096",
    "https://pbs.twimg.com/media/FxhrKS5WcAEGFHn?format=jpg&name=4096x4096",
    "https://pbs.twimg.com/media/FxhrKS5WcAEGFHn?format=jpg&name=4096x4096",
  ];
}
