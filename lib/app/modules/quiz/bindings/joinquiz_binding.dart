import 'package:get/get.dart';

import '../controllers/joinquiz_controller.dart';

class JoinquizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoinquizController>(
      () => JoinquizController(),
    );
  }
}
