import 'package:flutter/material.dart';

class DropPointCard extends StatelessWidget {
  final String title;

  const DropPointCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'lib/assets/images/drop_point.png',
            width: 23,
            height: 30,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontFamily: 'Poppins',
                color: Colors.black,
                height: 1.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
