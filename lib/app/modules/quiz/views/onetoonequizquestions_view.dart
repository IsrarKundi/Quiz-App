import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mcqs_app/app/modules/mcqs/controllers/mcqs_controller.dart';
import 'package:mcqs_app/app/modules/mcqs/controllers/score_card_controller.dart';
import 'package:mcqs_app/app/modules/mcqs/views/score_card_view.dart';

import '../controllers/onetoonequizquestions_controller.dart';

class OnetoonequizquestionsView
    extends GetView<OnetoonequizquestionsController> {
  const OnetoonequizquestionsView({super.key});
  @override
  Widget build(BuildContext context) {
    final McqsController controller = Get.put(McqsController());
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
            left: 20,
            right: 20,
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
                  'UI UX Design',
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
                padding: const EdgeInsets.all(16.0),
                child: Obx(() {
                  if (controller.mcqs.isEmpty) {
                    return const Center(child: Text('No questions available'));
                  }

                  final currentIndex = controller.currentIndex.value;

                  if (currentIndex < 0 ||
                      currentIndex >= controller.mcqs.length) {
                    return const Center(child: Text('Invalid question index'));
                  }

                  final currentMcq = controller.mcqs[currentIndex];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // MCQ Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${controller.mcqs.length} MCQs'),
                          Text(
                              'Level ${currentIndex.toString().padLeft(2, '0')}'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Horizontal List of Question Numbers
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.mcqs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.currentIndex.value = index;
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? Colors.blue
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
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
                            const SizedBox(height: 20),
                            // Display Options
                            Expanded(
                              child: ListView.builder(
                                itemCount: currentMcq.options.length,
                                itemBuilder: (context, index) {
                                  final option = currentMcq.options[index];
                                  return ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      child: Text(option.letter),
                                    ),
                                    title: Text(option.text),
                                    onTap: () {
                                      // Option selection logic
                                      Get.snackbar(
                                        'Option Selected',
                                        'You selected ${option.letter}: ${option.text}',
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      // Next/Submit Button
                      ElevatedButton(
                        onPressed: () {
                          if (currentIndex == controller.mcqs.length - 1) {
                            Get.to(() => const ScoreCardView(),
                                binding: BindingsBuilder(() {
                              Get.put(ScoreCardController(
                                  totalQuestions: 10, correctAnswers: 7));
                            }));

                            // Get.snackbar(
                            //   'Submitted',
                            //   'You have completed the quiz!',
                            // );
                            Get.toNamed('/onetoonescard');
                          } else {
                            controller.next();
                          }
                        },
                        child: Text(
                          currentIndex == controller.mcqs.length - 1
                              ? 'Submit'
                              : 'Next',
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
