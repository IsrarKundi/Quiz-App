import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottieAnimation extends StatefulWidget {
  final String lottieFile;
  final double speed;

  const CustomLottieAnimation({
    super.key,
    required this.lottieFile,
    this.speed = 1.0, required BoxFit fit, // Default speed is 1.0 (normal speed)
  });

  @override
  _CustomLottieAnimationState createState() => _CustomLottieAnimationState();
}

class _CustomLottieAnimationState extends State<CustomLottieAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with a default duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 2), // Default duration to avoid issues with repeat()
    )..repeat(); // Repeat the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      repeat: true,
      animate: true,
      widget.lottieFile,
      controller: _controller,
      // onLoaded: (composition) {
      //   // Adjust the duration based on the speed
      //   _controller.duration = composition.duration * (1 / widget.speed);
      //   _controller.forward();
      // },
    );
  }
}
