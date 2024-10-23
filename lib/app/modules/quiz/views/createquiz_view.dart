import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/createquiz_controller.dart';

class CreatequizView extends GetView<CreatequizController> {
  const CreatequizView({super.key});
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
                    ' Create Quiz',
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
                      // Quiz ID Row
                      Row(
                        children: [
                          const Text('Quiz ID:'),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              initialValue: '858 888 584',
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Handle edit icon press
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Quiz Password Row
                      Row(
                        children: [
                          const Text('Quiz Password:'),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              initialValue: '123456',
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Quiz Name Field
                      const Text('Quiz Name'),
                      TextFormField(
                        initialValue: 'Science',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Question Type Field
                      const Text('Question Type'),
                      TextFormField(
                        initialValue: 'Multiple choice 4 options',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Number of Questions
                      const Text('Number of Questions'),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Quiz Duration Field
                      const Text('Quiz Duration'),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Continue Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/createquizquestions');
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
