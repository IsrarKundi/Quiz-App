import 'package:get/get.dart';

import '../controllers/createquizquestions_controller.dart';

class CreatequizquestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatequizquestionsController>(
      () => CreatequizquestionsController(),
    );
  }
}
