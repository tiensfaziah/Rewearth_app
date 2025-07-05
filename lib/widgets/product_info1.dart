import 'package:flutter/material.dart';

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 92,
      margin: const EdgeInsets.only(top: 25),
      child: Stack(
        children: [
          // Background card
          Positioned(
            top: 3,
            left: 0,
            right: 0,
            child: Container(
              height: 89,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 9.302,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
            ),
          ),
          // Product name
          const Positioned(
            left: 17,
            top: 3,
            child: Text(
              'Vest Pria',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                height: 2.55, // 51px line height / 20px font size
              ),
            ),
          ),
          // Category tag
          const Positioned(
            right: 17,
            top: 0,
            child: Text(
              'New • For You',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w300,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.italic,
                height: 3.92, // 51px line height / 13px font size
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Heart icon
          Positioned(
            right: 16,
            top: 53,
            child: Container(
              width: 26,
              height: 26,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
