import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mcqs_app/components/custom_animation_lottie.dart';

import '../controllers/premium_controller.dart';

class PremiumView extends GetView<PremiumController> {
  const PremiumView({super.key});
  @override
  Widget build(BuildContext context) {
    final PremiumController premiumController = Get.put(PremiumController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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

            // Premium Screen Content
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Move to left alignment
                children: [
                  // Circular Image
                  const Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.transparent,
                      child: CustomLottieAnimation(
                        lottieFile: 'assets/images/qa.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Go Premium Text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'GO PREMIUM',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Premium Features List
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• Unlock All Premium Levels',
                          style: TextStyle(
                              fontSize: 15.32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '• Purchase Coins and Diamonds',
                          style: TextStyle(
                              fontSize: 15.32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '• Remove Ads',
                          style: TextStyle(
                              fontSize: 15.32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    child: Column(
                      children: [
                        Obx(() => Container(
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xff233586), // Set the same color for all containers
                                border: Border.all(
                                  color: premiumController
                                              .selectedOption.value ==
                                          'Weekly'
                                      ? Colors.white
                                      : Colors
                                          .transparent, // Border when selected
                                  width: 2, // Border thickness
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: const Text(
                                  'Weekly',
                                  style: TextStyle(
                                    fontSize: 17.05,
                                    color: Colors.white,
                                  ),
                                ),
                                leading: Radio<String>(
                                  value: 'Weekly',
                                  activeColor: Colors.white,
                                  groupValue:
                                      premiumController.selectedOption.value,
                                  onChanged: (String? value) {
                                    premiumController.changeOption(value!);
                                  },
                                ),
                                trailing: const Text(
                                  '10\$/Weekly',
                                  style: TextStyle(
                                    fontSize: 17.05,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        Obx(() => Container(
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xff233586), // Set the same color for all containers
                                border: Border.all(
                                  color: premiumController
                                              .selectedOption.value ==
                                          'Monthly'
                                      ? Colors.white
                                      : Colors
                                          .transparent, // Border when selected
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: const Text(
                                  'Monthly',
                                  style: TextStyle(
                                    fontSize: 17.05,
                                    color: Colors.white,
                                  ),
                                ),
                                leading: Radio<String>(
                                  value: 'Monthly',
                                  activeColor: Colors.white,
                                  groupValue:
                                      premiumController.selectedOption.value,
                                  onChanged: (String? value) {
                                    premiumController.changeOption(value!);
                                  },
                                ),
                                trailing: const Text(
                                  '20\$/Monthly',
                                  style: TextStyle(
                                    fontSize: 17.05,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        Obx(() => Container(
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xff233586), // Set the same color for all containers
                                border: Border.all(
                                  color: premiumController
                                              .selectedOption.value ==
                                          'Yearly'
                                      ? Colors.white
                                      : Colors
                                          .transparent, // Border when selected
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: const Text(
                                  'Yearly',
                                  style: TextStyle(
                                    fontSize: 17.05,
                                    color: Colors.white,
                                  ),
                                ),
                                leading: Radio<String>(
                                  value: 'Yearly',
                                  activeColor: Colors.white,
                                  groupValue:
                                      premiumController.selectedOption.value,
                                  onChanged: (String? value) {
                                    premiumController.changeOption(value!);
                                  },
                                ),
                                trailing: const Text(
                                  '80\$/Yearly',
                                  style: TextStyle(
                                    fontSize: 17.05,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),

                  const SizedBox(height: 2),

                  // Cancel Anytime Text Button
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Cancel Anytime',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Upgrade Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 110, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Upgrade',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff233586)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),

                  // Terms, Privacy Policy, Restore
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle Terms of Use tap
                          },
                          child: const Text(
                            'Terms of Use',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle Privacy Policy tap
                          },
                          child: const Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle Restore tap
                          },
                          child: const Text(
                            'Restore',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 15,
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                        color: Color(0xff425DFF),
                        // color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
