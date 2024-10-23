import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/createquizquestions_controller.dart';

class CreatequizquestionsView extends GetView<CreatequizquestionsController> {
  const CreatequizquestionsView({super.key});
  final int totalSlides = 15;
  final int currentSlide = 2; // Set the current active slide
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
                    ' Created Quiz',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question Number Text
                      const Text(
                        'Question number five',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // // Slider
                      // // Slider
                      // Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      //   child: Slider(
                      //     value:
                      //         2.5, // Initial value (e.g., middle of 5 slides)
                      //     min: 0,
                      //     max: 4,
                      //     divisions: 4,
                      //     activeColor:
                      //         Colors.blue, // Active portion of the slider
                      //     inactiveColor:
                      //         Colors.blue.withOpacity(0.3), // Inactive
                      //     onChanged: (value) {
                      //       // Handle slider value change
                      //     },
                      //   ),
                      // ),
// Indicator Dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(totalSlides, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: 12,
                            height: 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle, // Change to rectangle
                              color: index <=
                                      currentSlide // Current and previous indicators
                                  ? Colors.blue
                                  : Colors.blue
                                      .withOpacity(0.3), // Upcoming indicators
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 16),

                      // Quiz Questions Text
                      const Text(
                        'Quiz Questions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Quiz Questions TextFormField
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your question here',
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Quiz Answers Text
                      const Text(
                        'Quiz Answers',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Answer TextFormFields
                      Column(
                        children: [
                          _buildAnswerField('Answer one'),
                          const SizedBox(height: 8),
                          _buildAnswerField('Answer two'),
                          const SizedBox(height: 8),
                          _buildAnswerField('Answer three'),
                          const SizedBox(height: 8),
                          _buildAnswerField('Answer four'),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/sharequiz');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue, // Background color set to blue
                            foregroundColor:
                                Colors.white, // Text color set to white
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 36), // Increased padding
                            textStyle:
                                const TextStyle(fontSize: 18), // Increased font size
                          ),
                          child: const Text(
                            'Continue',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

Widget _buildAnswerField(String hint) {
  return TextFormField(
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      hintText: hint,
    ),
  );
}
