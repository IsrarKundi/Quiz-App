import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color containerColor;
  final VoidCallback onpress;
  final BoxDecoration? decoration;

  const MyButton({
    super.key,
    required this.title,
    this.textColor = Colors.white,
    this.containerColor = Colors.white,
    required this.onpress,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onpress,
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: 56,
          decoration: decoration ??
              BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xff1852EB),
                  Color(0xff4839D4),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}
