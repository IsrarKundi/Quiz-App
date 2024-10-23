import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mcqs_app/app/modules/auth/controllers/signin_controller.dart';
import 'package:mcqs_app/components/my_button.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    final SigninController signinController = Get.put(SigninController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed('/signin');
                      },
                      icon: const Icon(Icons.arrow_back_sharp),
                      iconSize: 20,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Create an account to continue!')),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none, // No outline
                      ),

                      hintText: 'First Name',
                      filled: true, // Enables the fillColor property

                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none, // No outline
                      ),

                      hintText: 'Last Name',
                      filled: true, // Enables the fillColor property

                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: signinController.emailcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none, // No outline
                      ),

                      hintText: 'Email',
                      filled: true, // Enables the fillColor property

                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none, // No outline
                      ),

                      hintText: 'Password',
                      filled: true, // Enables the fillColor property

                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none, // No outline
                      ),

                      hintText: 'Confirm Password',
                      filled: true, // Enables the fillColor property

                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  MyButton(
                    title: 'Register',
                    onpress: () {},
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/signin');
                          },
                          child: const Text(
                            'Log in',
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
    ));
  }
}
