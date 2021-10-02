import 'package:flutter/material.dart';

// creating Stateless Wideget for buttons
class MyButton extends StatelessWidget {
// declaring variables
  final Color? color;
  final Color textColor;
  final String buttonText;
  final VoidCallback? buttontapped;

//Constructor
  const MyButton({
    Key? key,
    this.color,
    required this.textColor,
    required this.buttonText,
    this.buttontapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
