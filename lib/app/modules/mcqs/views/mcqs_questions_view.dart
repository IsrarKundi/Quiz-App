import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqs_app/app/modules/mcqs/controllers/mcqs_controller.dart';
import 'package:mcqs_app/app/modules/mcqs/controllers/score_card_controller.dart';
import 'package:mcqs_app/app/modules/mcqs/views/score_card_view.dart';

class McqsQuestionsView extends GetView<McqsController> {
  const McqsQuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // final ScoreCardController scoreCardController =
    //     Get.put(ScoreCardController(totalQuestions: 10, correctAnswers: 8));
    final McqsController mcqsController = Get.put(McqsController());

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
            child: SizedBox(
              height: screenHeight * 0.04,
              width: screenWidth * 0.6,
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
                    'Mcqs Questions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
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
                padding: const EdgeInsets.all(16.0),
                child: Obx(() {
                  if (mcqsController.mcqs.isEmpty) {
                    return const Center(child: Text('No questions available'));
                  }

                  final currentIndex = mcqsController.currentIndex.value;

                  if (currentIndex < 0 ||
                      currentIndex >= mcqsController.mcqs.length) {
                    return const Center(child: Text('Invalid question index'));
                  }

                  final currentMcq = mcqsController.mcqs[currentIndex];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // MCQ Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${mcqsController.mcqs.length} MCQs',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1A1C1E),
                                fontSize: 16),
                          ),
                          Text(
                            'Level 0${controller.level.value}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1A1C1E),
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Horizontal List of Question Numbers
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mcqsController.mcqs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                mcqsController.currentIndex.value = index;
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? Colors.blue
                                      : Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                      color: currentIndex == index
                                          ? const Color(0xffFFFFFF)
                                          : Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Question and Options
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentMcq.question,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Display Options
                            Expanded(
                              child: Obx(() {
                                // Get the current MCQ based on currentIndex
                                final currentMcq = controller
                                    .mcqs[controller.currentIndex.value];
                                // print(currentMcq);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Display Options
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: controller.currentMcq.options.length,
                                        itemBuilder: (context, index) {
                                          final option = controller.currentMcq.options[index];
                                          final isSelected = controller.selectedOption.value == option.letter;
                                          // final isCorrect = option.isCorrect;

                                          return GestureDetector(
                                            onTap: () {
                                              // Option selection logic
                                              controller.selectOption(option.letter);
                                              // quizController.selectedOption.value = '';
                                              // Get.snackbar(
                                              //   'Option Selected',
                                              //   'You selected ${option.letter}: ${option.text}',
                                              // );
                                            },
                                            child: Obx(() => Container(
                                              margin: const EdgeInsets.symmetric(vertical: 5.0), // Adds space between containers
                                              padding: const EdgeInsets.all(2.0),
                                              decoration: BoxDecoration(
                                                color: controller.selectedOption.value == option.letter
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
                                                        color: controller.selectedOption.value == option.letter
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
                          ],
                        ),
                      ),
                      // Next/Submit Button
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff1852EB), Color(0xff4839D4)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(31),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            shadowColor: Colors.blueAccent,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 15),
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {
                            // scoreCardController.showConfetti;
                            // if (currentIndex ==
                            //     mcqsController.mcqs.length - 1) {
                            //   Get.to(() => const ScoreCardView(),
                            //       binding: BindingsBuilder(() {
                            //     Get.put(ScoreCardController(
                            //         totalQuestions: 10, correctAnswers: 7));
                            //   }));
                            //   Get.toNamed('/scorecardview');
                            // } else {
                            //   mcqsController.next();
                            // }
                            print('${controller.currentMcq.question}');
                            print('Current Index of mcqs: ${controller.currentIndex.value}');
                            print(controller.mcqs.length - 1 == controller.currentIndex.value);

                            if(controller.mcqs.length - 1 > controller.currentIndex.value){
                              // quizController.selectedOption('${quizController.mcqs[quizController.currentIndex.value]}');
                              controller.currentIndex.value = controller.currentIndex.value + 1;
                              controller.selectedOption.value =
                              ''; // Clear selected option when switching
                            }else{
                              controller.score.value = 0;

                              print('Score: ${controller.score.value}');
                              Get.offNamed('/Scorecardview');
                              controller.calculateScore();
                              print('Score: ${controller.score.value}');

                              // Get.delete<QuizController>(force: true)
                              controller.currentIndex.value = 0;
                              controller.selectedOption.value = '';
                              // controller.score.value = 0;

                            }
                          },
                          child: Text(
                            currentIndex == mcqsController.mcqs.length - 1
                                ? 'Submit'
                                : 'Next',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
