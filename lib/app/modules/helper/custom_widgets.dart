
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

Future<void> showCustomLoadingDialog(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: PopScope(
          canPop: false,
          child: Center(
            child: SizedBox(
              height: 70,
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: const [Colors.white],
                strokeWidth: 2,
              ),
            ),
          ),
        ),
      );
    },
  );
}