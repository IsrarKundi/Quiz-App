import 'package:get/get.dart';

import '../controllers/explorestudymcqs_controller.dart';

class ExplorestudymcqsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExplorestudymcqsController>(
      () => ExplorestudymcqsController(),
    );
  }
}
