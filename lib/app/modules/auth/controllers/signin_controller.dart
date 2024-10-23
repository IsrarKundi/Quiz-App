import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  var formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState?.validate() ?? false) {
      // Handle login logic here
      Get.snackbar('Success', 'Login successful!');
    }
  }

  final count = 0.obs;

  @override
  void onClose() {
    // Dispose of the nameController if used
    // emailController.dispose();
    // passwordController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
