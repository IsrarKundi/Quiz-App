import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onetoonescorecard_controller.dart';

class OnetoonescorecardView extends GetView<OnetoonescorecardController> {
  const OnetoonescorecardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnetoonescorecardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnetoonescorecardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
