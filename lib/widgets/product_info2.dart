import 'package:flutter/material.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Stack(
        children: [
          // Product title
          const Positioned(
            left: 0,
            top: 3,
            child: SizedBox(
              width: 127,
              height: 48,
              child: Text(
                'Ya Hoodie',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  height: 2.55,
                ),
              ),
            ),
          ),

          // New • For You label
          Positioned(
            right: 0,
            top: 0,
            child: SizedBox(
              width: 110,
              height: 36,
              child: Text(
                'New • For You',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Poppins',
                  height: 3.92,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
