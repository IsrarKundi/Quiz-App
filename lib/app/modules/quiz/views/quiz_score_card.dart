import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:mcqs_app/app/modules/mcqs/controllers/score_card_controller.dart';

import '../controllers/quiz_controller.dart';

class QuizScoreCard extends StatefulWidget {
  const QuizScoreCard({super.key});

  @override
  State<QuizScoreCard> createState() => _QuizScoreCardState();
}

class _QuizScoreCardState extends State<QuizScoreCard> {
  final QuizController quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final ScoreCardController scoreCardController =
        Get.put(ScoreCardController(totalQuestions: 10, correctAnswers: 8));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff1852EB),
                  Color(0xff4839D4),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.asset('assets/images/group.png'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                margin: const EdgeInsets.only(top: 105),
                padding: const EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 105),
              padding: const EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.66,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.2), // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'MCQS Level 01',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // First Container
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // First Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    // color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/scorecardteckicon.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  'Correct',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${quizController.score.value}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Second Row (Slider)
                        SizedBox(
                          height: 8,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius:
                                      0.0), // Smaller green circle
                            ),
                            child: Slider(
                              value: quizController.score.value/10,
                              onChanged: (value) {},
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Second Container
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // First Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    // color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/scorecardcrossicon.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  'Wrong',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${10 -quizController.score.value}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Second Row (Slider)
                        SizedBox(
                          height: 10,
                          width: 280,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius:
                                      0.0), // Smaller green circle
                            ),
                            child: Slider(
                              value: (10 - quizController.score.value)/10,
                              onChanged: (value) {},
                              activeColor: Colors.red,
                              inactiveColor: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 24,
                                  width: 24,
                                  child:
                                      Image.asset('assets/images/coins.png')),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text('Coins'),
                            ],
                          ),
                          const Text('30'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 24,
                                  width: 24,
                                  child:
                                      Image.asset('assets/images/daimond.png')),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text('Daimonds'),
                            ],
                          ),
                          const Text('00'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      // // Go back to the previous screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                      backgroundColor: const Color(0xff1852EB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Next Level',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 85,
            right: 85,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.5,
              // color: Colors.red,
              child: Image.asset(
                'assets/images/scorecard.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 15, // Prevent overflowing
            // right: 15, // Keep the content aligned
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            top: 60,
            right: 15,
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      color: Color(0xff425DFF),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    )
                ),
              ),
            ),
          ),

          // Lottie Confetti Animation
          Obx(() {
            return scoreCardController.isConfettiVisible.value
                ? Align(
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      'assets/images/scorecardconfetti.json', // Path to your Lottie JSON file
                      width: 300, // Set the width for the confetti
                      height: 300, // Set the height for the confetti
                      repeat: true, // Play once
                      onLoaded: (composition) {
                        // Optionally, do something when the animation finishes
                        Future.delayed(const Duration(seconds: 6), () {
                          scoreCardController
                              .hideConfetti(); // Hide confetti after 3 seconds
                        });
                      },
                    ),
                  )
                : Container(); // If confetti is not visible, show nothing
          }),

          // Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         'Score: 85', // Example score text
          //         style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          //       ),
          //       ElevatedButton(
          //         onPressed: scoreCardController
          //             .showConfetti, // Trigger confetti on button press
          //         child: Text('Celebrate!'),
          //       ),
          //     ],
          //   ),
          // ),

          // Confetti Widget
          // Align(
          //   alignment: Alignment.enter,
          //   child: ConfettiWidget(
          //     confettiController: scoreCardController
          //         .confettiController, // Use controller's confetti controller
          //     blastDirectionality:
          //         BlastDirectionality.explosive, // Show in all directions
          //     shouldLoop: false, // Play once and stop
          //     colors: const [
          //       Colors.green,
          //       Colors.blue,
          //       Colors.pink,
          //       Colors.orange,
          //       Colors.purple,
          //     ], // Confetti colors
          //   ),
          // ),
        ],
      ),
    );
  }
}
