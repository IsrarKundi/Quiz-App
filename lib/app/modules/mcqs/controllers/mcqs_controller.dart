import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Define the Option model class
class Option {
  final String letter;
  final String text;
  final bool isCorrect;

  Option({required this.letter, required this.text, required this.isCorrect});
}

// Define the Mcq model class
class Mcq {
  final String question;
  final List<Option> options;

  Mcq({required this.question, required this.options});
}



class McqsController extends GetxController {
  final ScrollController _scrollController = ScrollController();

  // Observable to keep track of the current index
  var currentIndex = 0.obs;

  // Observable to keep track of the selected option
  var selectedOption = ''.obs;

// To track if the selected option is correct
  var isOptionCorrect = false.obs;

  // Observable list of MCQs
  final RxList<Mcq> mcqs = <Mcq>[
    Mcq(
      question: 'What is Flutter?',
      options: [
        Option(
            letter: 'A',
            text: 'A framework for web development',
            isCorrect: false),
        Option(
            letter: 'B',
            text: 'A framework for mobile development',
            isCorrect: true),
        Option(letter: 'C', text: 'A programming language', isCorrect: false),
      ],
    ),
    Mcq(
      question: 'What is Dart?',
      options: [
        Option(
            letter: 'A',
            text: 'A framework for mobile development',
            isCorrect: false),
        Option(letter: 'B', text: 'A programming language', isCorrect: true),
        Option(letter: 'C', text: 'A type of coffee', isCorrect: false),
      ],
    ),
    // Add more MCQs here if needed
  ].obs;

  // Method to select an option
  void selectOption(String letter) {
    // Set the selected option
    selectedOption.value = letter;

    // Check if the selected option is correct
    final selectedOptionObject = mcqs[currentIndex.value]
        .options
        .firstWhere((option) => option.letter == letter);

    // Update isOptionCorrect based on whether the option is correct
    isOptionCorrect.value = selectedOptionObject.isCorrect;
  }

  // Method to move to the next question
  void next() {
    if (currentIndex.value < mcqs.length - 1) {
      currentIndex.value++; // Move to the next question
      selectedOption.value = ''; // Reset the selected option
      isOptionCorrect.value = false; // Reset correctness tracking
    }
  }

  // Method to check if the option is correct
  bool isCorrectOption(String letter) {
    final option =
        mcqs[currentIndex.value].options.firstWhere((o) => o.letter == letter);
    return option.isCorrect;
  }

  // Method to move to the previous question
  void previous() {
    if (currentIndex.value > 0) {
      currentIndex.value--; // Move to the previous question
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
