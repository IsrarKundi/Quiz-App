import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quiz_controller.dart';

class SimplequizCatagories extends StatefulWidget {
  const SimplequizCatagories({super.key});

  @override
  State<SimplequizCatagories> createState() => _SimplequizCatagoriesState();
}

class _SimplequizCatagoriesState extends State<SimplequizCatagories> {
  late ScrollController
      _scrollController; // Use 'late' to ensure it’s initialized in initState

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Don't forget to dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final QuizController quizController = Get.put(QuizController());
    final ScrollController scrollController = ScrollController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Background Gradient
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
            // App Bar-like section
            Positioned(
              top: 60,
              // left: 15, // Prevent overflowing
              // right: 15, // Keep the content aligned
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
                      'Quiz Catagories',
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
            // Bottom Container with GridView
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
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align content to the start
                    children: [
                      const Text(
                        'Categories',
                        textAlign: TextAlign.left, // Correct usage of textAlign
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Search Field
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(23),
                            ),
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Color(0xff8E8E8E)),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Expanded GridView
                      Expanded(
                        child: GridView.builder(
                          controller: scrollController,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: quizController.categories.length, // Number of items in the grid
                          itemBuilder: (context, index) {
                            // Get the current category
                            final category = quizController.categories[index];

                            return InkWell(
                              onTap: () async {
                                quizController.level.value = quizController.categories[index].level;
                                quizController.topic.value = quizController.categories[index].title;
                                // print(quizController.level.value);
                                await quizController.getQuiz(context);
                                // Get.toNamed('/quizquestions');
                                // print('Current Question: ${quizController.currentMcq.question}');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  // color: Colors.teal,
                                  borderRadius: BorderRadius.circular(10), // Add border radius
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Image.asset(
                                        quizController.imagePaths[index],
                                        height: 90, // Define the size of the image
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            category.title, // Display the title
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.37,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Text(
                                                'Level (${category.level.toString().padLeft(2, '0')})', // Display the level
                                                style: const TextStyle(
                                                  fontSize: 12.37,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(width: 37),
                                              Image.asset(
                                                'assets/images/coins.png',
                                                height: 16,
                                                width: 16,
                                                fit: BoxFit.fill,
                                              ),
                                              const SizedBox(width: 9),
                                              Image.asset(
                                                'assets/images/daimond.png',
                                                height: 16,
                                                width: 16,
                                                fit: BoxFit.fill,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
