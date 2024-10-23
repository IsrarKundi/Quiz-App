import 'package:get/get.dart';

import '../controllers/onetoonequizquestions_controller.dart';

class OnetoonequizquestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnetoonequizquestionsController>(
      () => OnetoonequizquestionsController(),
    );
  }
}
