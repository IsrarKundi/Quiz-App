import 'package:get/get.dart';

class JobsController extends GetxController {
  //TODO: Implement JobsController

  final count = 0.obs;

  void increment() => count.value++;

  var selectedIndex = 0.obs;

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
