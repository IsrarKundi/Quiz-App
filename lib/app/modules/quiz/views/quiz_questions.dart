import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqs_app/app/modules/quiz/controllers/quiz_controller.dart';

class QuizQuestions extends StatefulWidget {
  const QuizQuestions({super.key});

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  @override
  Widget build(BuildContext context) {
    final QuizController quizController = Get.put(QuizController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff1852EB), Color(0xff4839D4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // App Bar Row
          Positioned(
            top: 60,
            left: 15,
            right: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Main Content
          Positioned(
            bottom: 0,
            child: Container(
              height: screenHeight * 0.8,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Color(0xffF0F0F0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19.34),
                  topRight: Radius.circular(19.34),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${quizController.mcqs.length} Questions',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1A1C1E),
                            fontSize: 16,
                          ),
                        ),
                        Obx(()=>
                            Text(
                              'Level 0${quizController.level.value}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1A1C1E),
                                fontSize: 16,
                              ),
                            ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: quizController.mcqs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              quizController.currentIndex.value = index;
                              // Force the UI to rebuild after changing the index
                              quizController.selectedOption.value =
                              ''; // Clear selected option when switching
                            },
                            child: Obx(() => Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 4),
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: quizController.currentIndex.value ==
                                    index
                                    ? Colors.blue
                                    : Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    color:
                                    quizController.currentIndex.value ==
                                        index
                                        ? const Color(0xffFFFFFF)
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )),
                          );
                        },
                      ),
                    ),
                    Obx(() {
                      double circleWidth = 32; // Width of each circle
                      double margin = 4; // Margin between circles
                      double totalWidth = quizController.mcqs.length *
                          (circleWidth + 2 * margin);
                      double completedWidth =
                          (quizController.currentIndex.value + 1) *
                              (circleWidth + 2 * margin);

                      return Stack(
                        children: [
                          // Background gray line
                          Container(
                            height: 4, // Height of the progress line
                            color: const Color(
                                0xffD4D4D4), // Gray color for the uncompleted portion
                            width:
                            totalWidth, // Full width of the progress line
                          ),
                          // Blue progress line
                          Container(
                            height: 4, // Height of the progress line
                            color:
                            Colors.blue, // Color for the completed portion
                            width: completedWidth.clamp(0,
                                totalWidth), // Width of the progress line based on completed questions
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        // color: Colors.yellow,
                        width: 60, // Width of the circular timer
                        height: 60, // Height of the circular timer
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.blue,
                              width: 4), // Border color and width
                        ),
                        child: const Center(
                          child: Text('6'),
                        ),
                      ),
                    ),
                    // Question and Options
                    Expanded(
                      child: Obx(() {
                        // Get the current MCQ based on currentIndex
                        final currentMcq = quizController
                            .mcqs[quizController.currentIndex.value];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentMcq.question,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Display Options
                            Expanded(
                              child: ListView.builder(
                                itemCount: quizController.currentMcq.options.length,
                                itemBuilder: (context, index) {
                                  final option = quizController.currentMcq.options[index];
                                  final isSelected = quizController.selectedOption.value == option.letter;
                                  final isCorrect = option.isCorrect;

                                  return GestureDetector(
                                    onTap: () {
                                      // Option selection logic
                                      quizController.selectOption(option.letter);
                                      // quizController.selectedOption.value = '';
                                      Get.snackbar(
                                        'Option Selected',
                                        'You selected ${option.letter}: ${option.text}',
                                      );
                                    },
                                    child: Obx(() => Container(
                                      margin: const EdgeInsets.symmetric(vertical: 5.0), // Adds space between containers
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                        color: quizController.selectedOption.value == option.letter
                                            ? Color(0xff4839D4)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10.0), // Rounded corners
                                      ),
                                      child: Row(
                                        children: [
                                          // Letter inside a circular container
                                          Container(
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0XFFFFFFFF), // Background color of the letter container
                                            ),
                                            child: Text(
                                              option.letter, // Option letter
                                              style: const TextStyle(
                                                color: Color(0xff1A1C1E),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12.0), // Space between the letter and text
                                          // Option text
                                          Expanded(
                                            child: Text(
                                              option.text,
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                                color: quizController.selectedOption.value == option.letter
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    // Next/Submit Button
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff1852EB),
                              Color(0xff4839D4)
                            ], // Gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(
                              31), // Same border radius as the button
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, // Text color
                            shadowColor: Colors.blueAccent, // Shadow color
                            elevation: 5, // Elevation (shadow depth)
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  31), // Match container's radius
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 15),
                            backgroundColor: Colors
                                .transparent, // Make the button background transparent
                          ),
                          onPressed: () {
                            print('Current Index of mcqs: ${quizController.currentIndex.value}');
                            print(quizController.mcqs.length - 1 == quizController.currentIndex.value);

                            if(quizController.mcqs.length - 1 > quizController.currentIndex.value){
                              // quizController.selectedOption('${quizController.mcqs[quizController.currentIndex.value]}');
                              quizController.currentIndex.value = quizController.currentIndex.value + 1;
                              // Force the UI to rebuild after changing the index
                              quizController.selectedOption.value =
                              ''; // Clear selected option when switching
                            }else{
                              quizController.score.value = 0;

                              print('Score: ${quizController.score.value}');
                              Get.offNamed('/quizscorecard');
                              quizController.calculateScore();
                              // Get.delete<QuizController>(force: true)
                              quizController.currentIndex.value = 0;
                              quizController.userSelections.clear();
                              quizController.selectedOption.value = '';
                              // quizController.score.value = 0;

                            }




                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}