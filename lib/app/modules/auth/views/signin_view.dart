import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mcqs_app/components/my_button.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    final SigninController signinController = SigninController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF0F0F0),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 24,
          ),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 24, right: 24),
                    child: Column(
                      children: [
                        const Text(
                          'Sgin in to you Account',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child:
                                Text('Enter your email and password to login')),
                        const SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          controller: signinController.emailcontroller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none, // No outline
                            ),

                            hintText: 'Email',
                            filled: true, // Enables the fillColor property

                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: signinController.passwordcontroller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none, // No outline
                            ),
                            hintText: 'Password',
                            fillColor: Color(0xffFFFFFF),
                            filled: true,
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password.';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Color(0xff1E3A8A),
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        MyButton(
                          title: 'Log in',
                          onpress: () {
                            Get.toNamed('/home');
                            // if (controller.formKey.currentState?.validate() ??
                            //     false) {
                            //   // Handle login logic here
                            //   Get.toNamed(
                            //       '/home'); // Example navigation after successful login
                            // }
                          },
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Row(
                          children: [
                            Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width * .4,
                                color: const Color(0xffD9DDDF)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Or',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .4,
                              color: const Color(0xffD9DDDF),
                              height: 1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: Image.asset(
                                      'assets/images/googleicon.png')),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Continue with Google',
                                style: TextStyle(
                                  color: Color(0xff1A1C1E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: Image.asset(
                                      'assets/images/facebookicon.png')),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Continue with facebook',
                                style: TextStyle(
                                  color: Color(0xff1A1C1E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don’t have an account?',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('/register');
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color(0xff1E3A8A),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
