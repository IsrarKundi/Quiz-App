import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onetoone_controller.dart';

class OnetooneView extends GetView<OnetooneController> {
  const OnetooneView({super.key});
  @override
  Widget build(BuildContext context) {
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
                      'One to one Quiz',
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
                          hintText: 'Search',
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Expanded GridView
                      Expanded(
                        child: GridView.builder(
                          controller: scrollController,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: 10, // Number of items in the grid
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed('/onetoonequiz');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(
                                      10), // Add border radius
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Image.asset(
                                        'assets/images/sciencemcqs.png',
                                        height:
                                            90, // Define the size of the image
                                        // width: 100,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Science',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Text(
                                                'Level (01)',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(Icons.cabin,
                                                  color: Colors.white,
                                                  size: 18),
                                              Icon(Icons.diamond,
                                                  color: Colors.white,
                                                  size: 18),
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
