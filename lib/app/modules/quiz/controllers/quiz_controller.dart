import 'package:flutter/cupertino.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:mcqs_app/app/modules/mcqs/controllers/mcqs_controller.dart';

import '../../helper/custom_widgets.dart';

class categoryCard {
  final String title;
  final int level;

  categoryCard({required this.title, required this.level});
}


class QuizController extends GetxController {
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
        Option(
            letter: 'D',
            text: 'A Hyper text markup language',
            isCorrect: false),
      ],
    ),
    Mcq(
      question: 'What is Dart?',
      options: [
        Option(
            letter: 'A',
            text: 'A framework for mobile development',
            isCorrect: false),
        Option(letter: 'B', text: 'A type of coffee', isCorrect: false),
        Option(
            letter: 'C',
            text: 'A Hyper text markup language',
            isCorrect: false),
        Option(letter: 'D', text: 'A programming language', isCorrect: true),
      ],
    ),
    Mcq(
      question: 'What is the latest version of Flutter?',
      options: [
        Option(letter: 'A', text: 'Flutter 2.2', isCorrect: false),
        Option(letter: 'B', text: 'Flutter 3.0', isCorrect: true),
        Option(letter: 'C', text: 'Flutter 1.9', isCorrect: false),
      ],
    ),
    Mcq(
      question: 'Which language is used by Flutter?',
      options: [
        Option(letter: 'A', text: 'Java', isCorrect: false),
        Option(letter: 'B', text: 'Dart', isCorrect: true),
        Option(letter: 'C', text: 'Swift', isCorrect: false),
      ],
    ),
    Mcq(
      question: 'Which widget is used for non-scrolling lists?',
      options: [
        Option(letter: 'A', text: 'ListView', isCorrect: false),
        Option(letter: 'B', text: 'Column', isCorrect: true),
        Option(letter: 'C', text: 'GridView', isCorrect: false),
      ],
    ),
    Mcq(
      question: 'What is the use of the "pubspec.yaml" file in Flutter?',
      options: [
        Option(
            letter: 'A', text: 'To define the UI of the app', isCorrect: false),
        Option(
            letter: 'B',
            text: 'To manage project dependencies',
            isCorrect: true),
        Option(letter: 'C', text: 'To handle app routing', isCorrect: false),
      ],
    ),
    Mcq(
      question: 'Which widget allows you to capture user input in Flutter?',
      options: [
        Option(letter: 'A', text: 'TextFormField', isCorrect: true),
        Option(letter: 'B', text: 'ListView', isCorrect: false),
        Option(letter: 'C', text: 'Column', isCorrect: false),
      ],
    ),
    Mcq(
      question: 'What is the purpose of the `BuildContext` in Flutter?',
      options: [
        Option(
            letter: 'A',
            text: 'To access theme and other widget properties',
            isCorrect: true),
        Option(letter: 'B', text: 'To create new widgets', isCorrect: false),
        Option(letter: 'C', text: 'To handle routing', isCorrect: false),
      ],
    ),
    Mcq(
      question: 'What is the main advantage of using GetX in Flutter?',
      options: [
        Option(letter: 'A', text: 'Advanced animations', isCorrect: false),
        Option(
            letter: 'B',
            text: 'State management and navigation',
            isCorrect: true),
        Option(letter: 'C', text: 'Database management', isCorrect: false),
      ],
    ),
    Mcq(
      question: 'What is the significance of a "StatelessWidget" in Flutter?',
      options: [
        Option(
            letter: 'A',
            text: 'A widget that can hold state',
            isCorrect: false),
        Option(
            letter: 'B',
            text: 'A widget that does not hold state',
            isCorrect: true),
        Option(letter: 'C', text: 'A widget for animations', isCorrect: false),
      ],
    ),
  ].obs;

  static const geminiApiKey = 'AIzaSyBGlLB8cRP_kFFpp77nDxbipMykd_GNP7s';

  @override
  void onInit() {
    super.onInit();
    Gemini.init(apiKey: '$geminiApiKey');

    userSelections.assignAll(List<String?>.filled(mcqs.length, null));


  }


  ///..................................CALCULATING USER MARKS.................................


  // Observable to keep track of the current index
  var currentIndex = 0.obs;

  // Observable to keep track of the selected option
  var selectedOption = ''.obs;

  var userSelections = <String?>[].obs; // List to track user selections

  // A map to store correct answers, with question number as key and correct option as value.
  RxInt score = 0.obs;
  // Score calculation logic
  void calculateScore() {
    print('calculate score called');
    for (int i = 0; i < mcqs.length; i++) {
      if (userSelections[i] == mcqs[i].options.firstWhere((o)=> o.isCorrect).letter) {
        score++;
      }
    }
  }
  void selectOption(String optionLetter) {
    selectedOption.value = optionLetter;
    print(selectedOption.value);
    userSelections[currentIndex.value] = selectedOption.value; // Track the user's selection
  }

  final count = 0.obs;

  // Increment method for demonstration purposes
  void increment() => count.value++;

  @override
  void dispose() {
    // Clean up resources here if needed
    super.dispose();

  }

  // Method to go to the next MCQ
  void next() {
    if (currentIndex.value < mcqs.length - 1) {
      currentIndex.value++;
      selectedOption.value = ''; // Reset selected option for new question
    }
  }

  // Method to go to the previous MCQ
  void previous() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  // Method to check if the option is correct
  bool isCorrectOption(String letter) {
    final option =
        mcqs[currentIndex.value].options.firstWhere((o) => o.letter == letter);
    print(option.isCorrect);
    return option.isCorrect;
  }



  final List<String> imagePaths = [
    'assets/images/sciencemcqs.png',
    'assets/images/english.png',
    'assets/images/generalknowledge.png',
    'assets/images/worldcurrentaffairs.png',
    'assets/images/pakistancurrentaffair.png',
    'assets/images/mathematics.png',
    // Add more image paths or URLs
  ];


  final RxList<categoryCard> categories = <categoryCard>[
    categoryCard(title: 'Science', level: 02),
    categoryCard(title: 'English', level: 01),
    categoryCard(title: 'General Knowledge', level: 03),
    categoryCard(title: 'World Current Affairs', level: 01),
    categoryCard(title: 'Pakistan Current Affairs', level: 01),
    categoryCard(title: 'Mathematics', level: 02),
  ].obs;


  ///................................GENERATING QUIZ................................

  final RxInt level = 0.obs;
  final RxString topic = ''.obs;

  Mcq get currentMcq => mcqs[currentIndex.value];

  var isLoading = true.obs;

  Future<void> getQuiz(BuildContext context) async {
    // Show loading indicator
    isLoading.value = true;
    showCustomLoadingDialog(context);

    try {

      var prompt = '''
Generate 10 multiple choice questions (MCQs) for $topic, focusing on level $level.
Format each MCQ in the following format:

Mcq(
  question: 'Your question?',
  options: [
    Option(letter: 'A', text: 'Answer 1', isCorrect: true/false),
    Option(letter: 'B', text: 'Answer 2', isCorrect: true/false),
    Option(letter: 'C', text: 'Answer 3', isCorrect: true/false),
    Option(letter: 'D', text: 'Answer 4', isCorrect: true/false),
  ],
),
''';

      print('before request is made');

      // Send the request to Gemini API
      print(prompt);
      var response = await Gemini.instance.text(prompt);
      // currentIndex.value = 0;
      print(response);

      if (response?.content == null || response!.content!.parts!.isEmpty) {
        print("Received empty response from the API.");
        return;
      }

      // Access and parse the text from the response
      String? responseText = response.content!.parts![0].text;
      if (responseText == null || responseText.isEmpty) {
        print("Received empty response from the API.");
        return;
      }

      // Clear existing MCQs to avoid duplication
      mcqs.clear();
      print('previous mcqs cleared');

      final mcqList = extractMcqsFromResponse(responseText);

      // Populate the MCQs list
      mcqs.addAll(mcqList);
    } catch (e) {
      print("Error fetching questions and answers: $e");
    } finally {
      isLoading.value = false;
      Get.back(); // Close the loading dialog

      // Navigate to the quiz page if questions are successfully fetched
      if (mcqs.isNotEmpty) {
        Get.toNamed('/quizquestions');
        print(currentMcq.question);
      } else {
        print("No questions found, not navigating.");
      }
    }
  }
  bool startsWithRange(String line, int start, int end) {
    List<String> range = List.generate(end - start + 1, (index) => (start + index).toString());
    return range.any((number) => line.startsWith(number));
  }
  List<Mcq> extractMcqsFromResponse(String responseText) {
    List<Mcq> mcqList = [];
    String? currentQuestion;
    List<Option> options = [];
    bool isOptionBlock = false;

    // Split the response into lines and remove empty lines
    List<String> lines = responseText.split('\n').where((line) => line.trim().isNotEmpty).toList();

    for (String line in lines) {
      line = line.trim();

      // Detect the start of a new MCQ block
      if (line.startsWith("Mcq(") || line.startsWith("**Mcq(") || line.startsWith("**MCQ") || startsWithRange(line, 1, 10)) {
        if (currentQuestion != null && options.isNotEmpty) {
          mcqList.add(Mcq(question: currentQuestion, options: options));
        }

        // Reset for the new question
        currentQuestion = null;
        options = [];
        isOptionBlock = true;
      } else if (isOptionBlock && line.startsWith("Option(")) {
        // Extract option details using regex
        final optionRegex = RegExp(r"Option\(letter: '([A-D])', text: '(.*?)', isCorrect: (true|false)\)");
        final match = optionRegex.firstMatch(line);

        if (match != null) {
          String letter = match.group(1) ?? '';
          String text = match.group(2) ?? '';
          bool isCorrect = match.group(3) == 'true';
          options.add(Option(letter: letter, text: text, isCorrect: isCorrect));
        }
      } else if (isOptionBlock && line.startsWith("question:")) {
        // Extract question text
        final questionRegex = RegExp(r"question: '(.*?)'");
        final match = questionRegex.firstMatch(line);
        if (match != null) {
          currentQuestion = match.group(1);
        }
      }
    }

    // Add the last question if exists
    if (currentQuestion != null && options.isNotEmpty) {
      mcqList.add(Mcq(question: currentQuestion, options: options));
    }

    return mcqList;
  }


  String extractQuestion(String line) {
    // Use a regular expression to extract the question text
    final regex = RegExp(r"question:\s*'([^']*)'", caseSensitive: false);
    final match = regex.firstMatch(line);

    // Check if a match was found and return the question text
    if (match != null && match.groupCount > 0) {
      return match.group(1) ?? "Unknown question format";
    }

    // Fallback for cases where the question is not formatted correctly
    return "Unknown question format";
  }


  Option extractOption(String line) {
    // Extracts option letter, text, and whether it's correct
    final letterStart = line.indexOf("letter: '");
    final letterEnd = line.indexOf("'", letterStart + 9);

    // Ensure the letter extraction is valid
    String letter = '';
    if (letterStart != -1 && letterEnd != -1 && letterEnd > letterStart) {
      letter = line.substring(letterStart + 9, letterEnd);
    }

    final textStart = line.indexOf("text: '");
    final textEnd = line.indexOf("'", textStart + 7);

    // Ensure the text extraction is valid
    String text = '';
    if (textStart != -1 && textEnd != -1 && textEnd > textStart) {
      text = line.substring(textStart + 7, textEnd);
    }

    // Determine if the option is correct
    final isCorrect = line.contains("isCorrect: true");
    print(Option);
    return Option(letter: letter, text: text, isCorrect: isCorrect);
  }

}
