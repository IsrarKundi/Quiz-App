import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});
  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.put(QuizController());
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
                    'Quiz',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Main Content
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/simplequizcatagories');
                          },
                          child: Container(
                            height: screenHeight * .16,
                            width: screenWidth * 1,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(19.34),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.09),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xff70F2DB),
                                        Color(0xff23BBC5)
                                      ])),
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                        'assets/images/playerone.png'),
                                  ),
                                ),
                                const Text('Simple Quiz'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/onetoone');
                          },
                          child: Container(
                            height: screenHeight * .16,
                            width: screenWidth * 1,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(19.34),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.09),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xff70F2DB),
                                        Color(0xff23BBC5)
                                      ])),
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                        'assets/images/playerone.png'),
                                  ),
                                ),
                                const Text('01 VS 01'),
                                Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.09),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xffCF65F4),
                                        Color(0xff952CB9)
                                      ])),
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                      'assets/images/playertwo.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/joinquiz');
                          },
                          child: Container(
                            height: screenHeight * .16,
                            width: screenWidth * 1,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(19.34),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.09),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xff70F2DB),
                                        Color(0xff23BBC5)
                                      ])),
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                        'assets/images/playerone.png'),
                                  ),
                                ),
                                const Text('Join Quiz'),
                                Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.09),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xffCF65F4),
                                        Color(0xff952CB9)
                                      ])),
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                      'assets/images/playertwo.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/createquiz');
                          },
                          child: Container(
                            height: screenHeight * .16,
                            width: screenWidth * 1,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(19.34),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.09),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xff70F2DB),
                                        Color(0xff23BBC5)
                                      ])),
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                        'assets/images/playerone.png'),
                                  ),
                                ),
                                const Text('Create Quiz'),
                                Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.09),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xffCF65F4),
                                        Color(0xff952CB9)
                                      ])),
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                      'assets/images/playertwo.png',
                                      fit: BoxFit.fill,
                                    ),
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
              ),
            ),
          ],
        ));
  }
}
