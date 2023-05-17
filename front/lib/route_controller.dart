import 'package:get/get.dart';

class RouteController extends GetxController {
  RxInt index = 0.obs;

  setNextIndex() {
    index++;
  }

  setPreviosIndex() {
    index--;
  }
}
