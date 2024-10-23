import 'package:get/get.dart';

import '../controllers/createquiz_controller.dart';

class CreatequizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatequizController>(
      () => CreatequizController(),
    );
  }
}
