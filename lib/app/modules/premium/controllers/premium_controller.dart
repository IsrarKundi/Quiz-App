import 'package:get/get.dart';

class PremiumController extends GetxController {
  //TODO: Implement PremiumController

  final count = 0.obs;

  // Observable to track the selected radio button
  var selectedOption = 'Option 1'.obs;

  // Function to change the selected option
  void changeOption(String value) {
    selectedOption.value = value;
  }

  void increment() => count.value++;
}
