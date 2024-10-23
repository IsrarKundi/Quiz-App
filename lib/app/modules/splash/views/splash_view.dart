import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mcqs_app/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    // final SplashController controller = Get.put(SplashController());

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: screenHeight * 0.75,
                width: screenWidth * 1,
                child: Image.asset(
                  'assets/images/splashmaskgroup.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.10,
              child: SizedBox(
                // color: Colors.yellow,
                height: screenHeight * 0.35,
                width: screenWidth * 0.8,

                child: Image.asset('assets/images/splashmcqsquiz.png'),
              ),
            ),
            Positioned(
                top: screenHeight * 0.6,
                left: screenWidth * 0.13,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: 'MCQS ',
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFF500)),
                    ),
                    TextSpan(
                      text: 'Pro\n',
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF)),
                    ),
                    TextSpan(
                      text:
                          "Dive into engaging Quizez and Test\nYour skills with thousands of MCQs.",
                      style: TextStyle(
                        fontSize: 16.8,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.78,
                left: MediaQuery.of(context).size.width * 0.16,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.ONBOARDING);
                  },
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.65,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Let\'s Start',
                        style: TextStyle(
                          color: Color(0xff4246DB),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
