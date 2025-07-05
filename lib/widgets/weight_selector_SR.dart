import 'package:flutter/material.dart';

class WeightSelectorWidget extends StatelessWidget {
  final int weight;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const WeightSelectorWidget({
    Key? key,
    required this.weight,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Decrement button
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFFD3D3D3),
            ),
            child: const Center(
              child: Text(
                '-',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Weight display
        Container(
          constraints: const BoxConstraints(minWidth: 20),
          child: Text(
            weight.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Increment button
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFFD3D3D3),
            ),
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
