import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String iconPath;
  final String title;

  const MenuItemWidget({
    Key? key,
    required this.iconPath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: 22,
          height: 22,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 2,
            ),
          ),
        ),
      ],
    );
  }
}
