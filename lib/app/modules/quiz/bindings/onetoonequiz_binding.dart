import 'package:get/get.dart';

import '../controllers/onetoonequiz_controller.dart';

class OnetoonequizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnetoonequizController>(
      () => OnetoonequizController(),
    );
  }
}
