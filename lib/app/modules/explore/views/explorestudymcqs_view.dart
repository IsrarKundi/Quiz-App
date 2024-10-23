import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/explorestudymcqs_controller.dart';

class ExplorestudymcqsView extends GetView<ExplorestudymcqsController> {
  const ExplorestudymcqsView({super.key});
  @override
  Widget build(BuildContext context) {
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
              left: 10,
              right: 150,
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
                    'Mcqs Study',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 1; i <= 10; i++) ...[
                          // Question Text
                          Text(
                            'Question $i:',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Question based on Science
                          Text(
                            i == 1
                                ? 'What is the chemical symbol for water?'
                                : i == 2
                                    ? 'What planet is known as the Red Planet?'
                                    : i == 3
                                        ? 'What gas do plants absorb from the atmosphere?'
                                        : i == 4
                                            ? 'What is the hardest natural substance on Earth?'
                                            : i == 5
                                                ? 'How many planets are in the solar system?'
                                                : i == 6
                                                    ? 'What is the process by which plants make food?'
                                                    : i == 7
                                                        ? 'What is the boiling point of water in Celsius?'
                                                        : i == 8
                                                            ? 'Which element is known as the building block of life?'
                                                            : i == 9
                                                                ? 'What is the speed of light in a vacuum?'
                                                                : 'What organ in the human body is responsible for pumping blood?',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 8),

                          // Choices with radio buttons
                          Column(
                            children: [
                              for (int j = 1; j <= 4; j++) ...[
                                Row(
                                  children: [
                                    Radio<int>(
                                      value: j,
                                      groupValue:
                                          0, // Replace with the selected option
                                      onChanged: (value) {
                                        // Handle choice selection
                                      },
                                    ),
                                    Text(
                                      i == 1 && j == 1
                                          ? 'H2O'
                                          : i == 1 && j == 2
                                              ? 'CO2'
                                              : i == 1 && j == 3
                                                  ? 'O2'
                                                  : i == 1 && j == 4
                                                      ? 'CH4'
                                                      : i == 2 && j == 1
                                                          ? 'Earth'
                                                          : i == 2 && j == 2
                                                              ? 'Mars'
                                                              : i == 2 && j == 3
                                                                  ? 'Jupiter'
                                                                  : i == 2 &&
                                                                          j == 4
                                                                      ? 'Venus'
                                                                      : i == 3 &&
                                                                              j == 1
                                                                          ? 'Oxygen'
                                                                          : i == 3 && j == 2
                                                                              ? 'Carbon dioxide'
                                                                              : i == 3 && j == 3
                                                                                  ? 'Nitrogen'
                                                                                  : i == 3 && j == 4
                                                                                      ? 'Hydrogen'
                                                                                      : i == 4 && j == 1
                                                                                          ? 'Gold'
                                                                                          : i == 4 && j == 2
                                                                                              ? 'Iron'
                                                                                              : i == 4 && j == 3
                                                                                                  ? 'Diamond'
                                                                                                  : i == 4 && j == 4
                                                                                                      ? 'Graphite'
                                                                                                      : i == 5 && j == 1
                                                                                                          ? '8'
                                                                                                          : i == 5 && j == 2
                                                                                                              ? '7'
                                                                                                              : i == 5 && j == 3
                                                                                                                  ? '9'
                                                                                                                  : i == 5 && j == 4
                                                                                                                      ? '10'
                                                                                                                      : i == 6 && j == 1
                                                                                                                          ? 'Photosynthesis'
                                                                                                                          : i == 6 && j == 2
                                                                                                                              ? 'Respiration'
                                                                                                                              : i == 6 && j == 3
                                                                                                                                  ? 'Digestion'
                                                                                                                                  : i == 6 && j == 4
                                                                                                                                      ? 'Excretion'
                                                                                                                                      : i == 7 && j == 1
                                                                                                                                          ? '100°C'
                                                                                                                                          : i == 7 && j == 2
                                                                                                                                              ? '0°C'
                                                                                                                                              : i == 7 && j == 3
                                                                                                                                                  ? '50°C'
                                                                                                                                                  : i == 7 && j == 4
                                                                                                                                                      ? '200°C'
                                                                                                                                                      : i == 8 && j == 1
                                                                                                                                                          ? 'Carbon'
                                                                                                                                                          : i == 8 && j == 2
                                                                                                                                                              ? 'Oxygen'
                                                                                                                                                              : i == 8 && j == 3
                                                                                                                                                                  ? 'Hydrogen'
                                                                                                                                                                  : i == 8 && j == 4
                                                                                                                                                                      ? 'Nitrogen'
                                                                                                                                                                      : i == 9 && j == 1
                                                                                                                                                                          ? '300,000 km/s'
                                                                                                                                                                          : i == 9 && j == 2
                                                                                                                                                                              ? '150,000 km/s'
                                                                                                                                                                              : i == 9 && j == 3
                                                                                                                                                                                  ? '1,000,000 km/s'
                                                                                                                                                                                  : i == 9 && j == 4
                                                                                                                                                                                      ? '10,000 km/s'
                                                                                                                                                                                      : i == 10 && j == 1
                                                                                                                                                                                          ? 'Liver'
                                                                                                                                                                                          : i == 10 && j == 2
                                                                                                                                                                                              ? 'Lungs'
                                                                                                                                                                                              : i == 10 && j == 3
                                                                                                                                                                                                  ? 'Heart'
                                                                                                                                                                                                  : i == 10 && j == 4
                                                                                                                                                                                                      ? 'Brain'
                                                                                                                                                                                                      : '',
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 16), // Spacing between questions
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
