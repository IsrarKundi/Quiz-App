import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqs_app/models/onboardinginfo.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == OnboardingPages.length - 1;
  forwardAction() {
    if (isLastPage) {
      Get.toNamed('/signin');
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<Onboardinginfo> OnboardingPages = [
    Onboardinginfo(
        'assets/images/onboardingscreen1.png',
        'Master the Essentials with MCQs',
        'Test your knowledge with our extensive MCQs library, covering everything from basics to advanced topics. Track your progress and sharpen your skills!'),
    Onboardinginfo(
        'assets/images/onboardingscreen2.png',
        'Challenge Yourself\n with Exciting Quizzes',
        'Engage in a variety of quizzes designed to entertain and educate. Boost your knowledge and become a quiz master!'),
    Onboardinginfo(
        'assets/images/onboardingscreen3.png',
        'Compete and Conquer in Real-Time Battles',
        'Challenge friends or opponents in thrilling quiz and MCQ duels. Climb the leaderboards and prove your mastery!'),
  ];

  final count = 0.obs;

  void increment() => count.value++;
}
