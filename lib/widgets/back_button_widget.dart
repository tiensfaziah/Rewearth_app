// lib/widgets/back_button_widget.dart
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 16,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
