import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqs_app/app/modules/onboarding/controllers/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.selectedPageIndex.call,
                itemCount: controller.OnboardingPages.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 1,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff1852EB), Color(0xff4839D4)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        ),
                      ),
                      Positioned(
                        top: 65,
                        left: 50,
                        child: SizedBox(
                          height: 248,
                          width: 248,
                          child: Image.asset(
                            controller.OnboardingPages[index].imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * .47,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 52,
                                  left: 25,
                                  right: 25,
                                ),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  controller.OnboardingPages[index].title,
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: Text(
                                    textAlign: TextAlign.center,
                                    controller
                                        .OnboardingPages[index].description),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
            Positioned(
              bottom: 110,
              left: 100,
              right: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        controller.OnboardingPages.length,
                        (index) => Obx(() {
                              return Container(
                                margin: const EdgeInsets.all(4),
                                height: 4,
                                width: 9,
                                decoration: BoxDecoration(
                                  color: controller.selectedPageIndex.value ==
                                          index
                                      ? const Color(0xff1852EB)
                                      : const Color(0xffD9D9D9),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            }))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 25, right: 25),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.toNamed('/home');
                        },
                        child: const Text(
                          'Skip',
                          style:
                              TextStyle(color: Color(0xff3F3F3F), fontSize: 18),
                        )),
                    FloatingActionButton(
                      backgroundColor:
                          Colors.transparent, // Make the background transparent
                      // elevation: 0, // Remove the default shadow if needed
                      onPressed: () {
                        controller.forwardAction();
                      },
                      child: Stack(
                        children: [
                          // Gradient Container
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff1852EB),
                                  Color(0xff4839D4),
                                ], // Replace with your gradient colors
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle, // Make sure it's circular
                            ),
                          ),
                          // Icon or content
                          Center(
                            child: Image.asset(
                              'assets/images/onboardingfloatingactionbutton.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
