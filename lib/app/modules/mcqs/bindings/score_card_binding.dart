import 'package:get/get.dart';
import 'package:mcqs_app/app/modules/mcqs/controllers/score_card_controller.dart';

class ScoreCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoreCardController>(() => ScoreCardController(
        totalQuestions: Get.arguments['totalQuestions'],
        correctAnswers: Get.arguments['correctAnswers']));
  }
}
