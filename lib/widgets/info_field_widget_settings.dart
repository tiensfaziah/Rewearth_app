import 'package:flutter/material.dart';

class InfoFieldWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool isEmail;

  const InfoFieldWidget({
    Key? key,
    required this.label,
    required this.value,
    this.isEmail = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 2,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 26,
            vertical: isEmail ? 12 : 15,
          ),
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
          child: Text(
            value,
            style: TextStyle(
              fontSize: isEmail ? 12 : 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF666666),
              height: isEmail ? 2.25 : 1,
            ),
          ),
        ),
      ],
    );
  }
}
