import 'package:get/get.dart';

import '../controllers/onetoone_controller.dart';

class OnetooneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnetooneController>(
      () => OnetooneController(),
    );
  }
}
