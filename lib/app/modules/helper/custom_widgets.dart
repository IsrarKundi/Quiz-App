
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../quiz/controllers/quiz_controller.dart';

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


class CountDownTimerWidget extends StatefulWidget {
  const CountDownTimerWidget({Key? key}) : super(key: key);

  @override
  _CountDownTimerWidgetState createState() => _CountDownTimerWidgetState();
}

class _CountDownTimerWidgetState extends State<CountDownTimerWidget>
    with SingleTickerProviderStateMixin {
  final CountDownController _controller = CountDownController();
  late AnimationController _animationController;
  Animation<Color?>? _colorAnimation;

  // Replace with your actual controller
  final QuizController controller = Get.find<QuizController>();

  // Track the last known index
  int lastIndex = -1;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with the duration of the countdown
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    // Create a ColorTween animation from blue to grey
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.grey[300],
    ).animate(_animationController);

    // Start the countdown
    _controller.restart(duration: 6);
    _animationController.forward(from: 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Check if current index has changed
    if (controller.currentIndex.value != lastIndex) {
      // Update the lastIndex
      lastIndex = controller.currentIndex.value;

      // Restart countdown and color animation
      _controller.restart(duration: 6); // Restart countdown
      _animationController.forward(from: 0); // Restart color animation
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: AnimatedBuilder(
        animation: _colorAnimation ?? _animationController,
        builder: (context, child) {
          return CircularCountDownTimer(
            duration: 6, // Set duration to 6 seconds
            initialDuration: 0,
            controller: _controller,
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.height / 7,
            ringColor: Colors.grey[300]!,
            fillColor: Colors.blue!,
            strokeWidth: 3.0,
            strokeCap: StrokeCap.round,
            textStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            textFormat: CountdownTextFormat.S,
            isReverse: false,
            isReverseAnimation: false,
            isTimerTextShown: true,
            autoStart: true,
            onStart: () {
              debugPrint('Countdown Started');
            },
            onComplete: () {
              debugPrint('Countdown Ended');
              // Implement quiz controller logic here
              if (controller.mcqs.length - 1 > controller.currentIndex.value) {
                controller.currentIndex.value += 1;
                controller.selectedOption.value = ''; // Clear selected option
              } else {
                controller.score.value = 0;
                debugPrint('Score: ${controller.score.value}');
                Get.offNamed('/quizscorecard');
                controller.calculateScore();
                controller.currentIndex.value = 0;
                controller.selectedOption.value = '';
              }
            },

            timeFormatterFunction: (defaultFormatterFunction, duration) {
              if (duration.inSeconds == 0) {
                return "Start";
              } else {
                return Function.apply(defaultFormatterFunction, [duration]);
              }
            },
          );
        },
      ),
    );
  }
}


