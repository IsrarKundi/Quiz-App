import 'package:get/get.dart';

import '../controllers/onetoonescorecard_controller.dart';

class OnetoonescorecardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnetoonescorecardController>(
      () => OnetoonescorecardController(),
    );
  }
}
