import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shadowColor: Colors.black.withOpacity(0.25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(
              color: borderColor,
              width: borderColor == Colors.transparent ? 0 : 1,
            ),
          ),
          padding: EdgeInsets.zero,
        ).copyWith(
          elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.25)),
        ),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 3.64,
            ),
          ),
        ),
      ),
    );
  }
}
