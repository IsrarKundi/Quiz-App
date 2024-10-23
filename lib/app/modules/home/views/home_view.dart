import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:mcqs_app/components/custom_animation_lottie.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    // Get the screen's width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust padding based on screen size
    double horizontalPadding = screenWidth * 0.05; // 5% of screen width
    double verticalPadding = screenHeight * 0.02; // 2% of screen height
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon:
                Image.asset('assets/images/drwericon.png'), // Your custom image
            onPressed: () {
              Scaffold.of(context)
                  .openDrawer(); // Opens the drawer when the icon is pressed
            },
          ),
        ),
        backgroundColor: const Color(0xff1852EB),
        actions: [
          // Profile Image aligned to the right side of AppBar
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                Get.toNamed('/profile');
              },
              child: const CircleAvatar(
                radius: 20, // Adjust size as needed

                backgroundImage: AssetImage(
                    'assets/images/homeprofileimage.png'), // Replace with your image URL
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6, // 60% of screen width
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff1852EB), Color(0xff4839D4)])),
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    // Adjust the size of the circle
                    // backgroundImage: AssetImage(
                    //     'assets/images/facebookicon.jpg'), // Your image asset

                    child: CustomLottieAnimation(
                      lottieFile: 'assets/images/qa.json',
                      fit: BoxFit.cover,
                    ), // Optional: background color if image doesn't cover the circle
                  ),
                )),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawerhomeicon.svg',
                // color: Colors.blue,
              ),
              title: const Text('Home'),
              onTap: () {
                if (Get.currentRoute == '/home') {
                  Get.back();
                } else {
                  Get.toNamed('/home');
                }
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawerpremiumicon.svg',
                height: 34,
                width: 35.42,
              ),
              title: const Text('Permium'),
              onTap: () {
                Get.toNamed('/premium');
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawersettingsicon.svg',
                height: 34,
                width: 35.42,
              ),
              title: const Text('Settings'),
              onTap: () {
                Get.toNamed('/profile');
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawerrateusicon.svg',
                height: 34,
                width: 35.42,
              ),
              title: const Text('Rate Us'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer
                // Navigate to Settings Screen or perform other actions
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawershareicon.svg',
                height: 34,
                width: 35.42,
              ),
              title: const Text('Share Us'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer
                // Navigate to Settings Screen or perform other actions
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawercontactusicon.svg',
                height: 34,
                width: 35.42,
              ),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer
                // Navigate to Contact Screen or perform other actions
              },
            ),
          ],
        ),
      ),
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
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: screenWidth,
                height: screenHeight * .15,
                decoration: const BoxDecoration(
                    // color: Colors.yellow,
                    ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, James',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Let's test your knowledge",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                  width: screenWidth,
                  height: screenHeight * .18,
                  decoration: const BoxDecoration(
                      // color: Colors.red,
                      ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MCQS Pro',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36.63,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                textAlign: TextAlign.center,
                                "Dive into Engaging Quizez and Test \n Your Skills with thousands of MCQS.",
                                style: TextStyle(
                                  fontSize: 12.82,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          // Adjust the size of the circle
                          // backgroundImage: AssetImage(
                          //     'assets/images/facebookicon.jpg'), // Your image asset

                          child: CustomLottieAnimation(
                            lottieFile: 'assets/images/qa.json',
                            fit: BoxFit.cover,
                          ), // Optional: background color if image doesn't cover the circle
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * .6,
              decoration: const BoxDecoration(
                color: Color(0xffF0F0F0),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(19.34),
                    topRight: Radius.circular(19.34)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(19.34)),
                            height: 159,
                            width: 159,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      '/mcqs',
                                    );
                                  },
                                  child: Container(
                                    height: 88.78,
                                    width: 88.78,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.09),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0XFF70F2DB),
                                            Color(0XFF23BBC5),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/images/mcqshome.svg', // Path to your SVG file
                                        width: 40.21, // Width of the SVG image
                                        height: 52.8, // Height of the SVG image
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'mcqs',
                                  style: TextStyle(
                                    fontSize: 15.47,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        InkWell(
                          onTap: () {
                            Get.toNamed('/simplequizcatagories');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(19.34)),
                            height: 159,
                            width: 159,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 88.78,
                                  width: 88.78,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.09),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0XFFCF65F4),
                                          Color(0XFF952CB9),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/images/quizhome.svg', // Path to your SVG file
                                      width: 40.21, // Width of the SVG image
                                      height: 52.8, // Height of the SVG image
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Quiz',
                                  style: TextStyle(
                                    fontSize: 15.47,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(19.34)),
                          height: 159,
                          width: 159,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/explore');
                                },
                                child: Container(
                                  height: 88.78,
                                  width: 88.78,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.09),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0XFFFFCF53),
                                          Color(0XFFFF9900),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/images/explorehome.svg', // Path to your SVG file
                                      width: 40.21, // Width of the SVG image
                                      height: 52.8, // Height of the SVG image
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Explore',
                                style: TextStyle(
                                  fontSize: 15.47,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(19.34)),
                          height: 159,
                          width: 159,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/jobs');
                                },
                                child: Container(
                                  height: 88.78,
                                  width: 88.78,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.09),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0XFFFF9252),
                                            Color(0XFFFF3F15),
                                          ])),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/images/jobshome.svg', // Path to your SVG file
                                      width: 40.21, // Width of the SVG image
                                      height: 52.8, // Height of the SVG image
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Jobs',
                                style: TextStyle(
                                  fontSize: 15.47,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
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
