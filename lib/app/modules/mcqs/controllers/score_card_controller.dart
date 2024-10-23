import 'package:get/get.dart';

class ScoreCardController extends GetxController {
  final int totalQuestions;
  final int correctAnswers;

  ScoreCardController({
    required this.totalQuestions,
    required this.correctAnswers,
  });

  // Calculate percentage of correct answers
  double get percentage => (correctAnswers / totalQuestions) * 100;

  var isConfettiVisible = true.obs; // Observable to track confetti visibility

  // Show confetti function
  void showConfetti() {
    isConfettiVisible.value = true; // Show confetti
  }

  // Hide confetti function
  void hideConfetti() {
    isConfettiVisible.value = true; // Hide confetti
  }

  // late ConfettiController confettiController;

  // @override
  // void onInit() {
  //   super.onInit();
  //   // Initialize the confetti controller with a duration
  //   confettiController = ConfettiController(duration: const Duration(seconds: 3));
  // }

  // @override
  // void onClose() {
  //   confettiController.dispose(); // Dispose of the controller when no longer needed
  //   super.onClose();
  // }

  // // Function to start confetti
  // void showConfetti() {
  //   confettiController.play(); // This triggers the confetti animation
  // }
}
