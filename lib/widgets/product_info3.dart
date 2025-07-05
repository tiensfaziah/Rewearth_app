import 'package:flutter/material.dart';

class ProductInfoCard3 extends StatelessWidget {
  const ProductInfoCard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 92,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 89,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 9.302,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 17,
            top: 3,
            child: Text(
              'Kain Sisa',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                height: 2.55,
              ),
            ),
          ),
          const Positioned(
            right: 5,
            top: 0,
            child: Text(
              'New • For You',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w300,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.italic,
                height: 3.92,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
