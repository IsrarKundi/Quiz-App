import 'package:get/get.dart';

import '../controllers/sharequiz_controller.dart';

class SharequizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SharequizController>(
      () => SharequizController(),
    );
  }
}
