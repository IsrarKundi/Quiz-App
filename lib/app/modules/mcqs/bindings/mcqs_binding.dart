import 'package:get/get.dart';

import '../controllers/mcqs_controller.dart';

class McqsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<McqsController>(
      () => McqsController(),
    );
  }
}
