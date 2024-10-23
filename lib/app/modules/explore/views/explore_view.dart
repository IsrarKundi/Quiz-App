import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final List<String> imagePaths = [
      'assets/images/sciencemcqs.png',
      'assets/images/english.png',
      'assets/images/generalknowledge.png',
      'assets/images/worldcurrentaffairs.png',
      'assets/images/pakistancurrentaffair.png',
      'assets/images/mathematics.png',
      // Add more image paths or URLs
    ];
    final List<String> topics = [
      'Science',
      'English',
      'General Knowledge',
      'World Current Affairs',
      'Pakistan Current Affairs',
      'Mathematics'
    ];
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
                      'Explore',
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
                      const SizedBox(height: 24),
                      // Expanded GridView
                      Expanded(
                        child: GridView.builder(
                          controller: scrollController,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 31.61,
                            mainAxisSpacing: 17,
                          ),
                          itemCount:
                              imagePaths.length, // Number of items in the grid
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed('explorestudymcqs');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.white, // Border color
                                    width: 1.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      7.6), // Add border radius
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Image.asset(
                                        imagePaths[index],
                                        height:
                                            110, // Define the size of the image
                                        // width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.83, left: 4),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              topics[index],
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.37,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Level (01)',
                                                  style: TextStyle(
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
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
