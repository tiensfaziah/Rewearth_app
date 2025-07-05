import 'package:flutter/material.dart';

class ProductSpecsCards3 extends StatelessWidget {
  const ProductSpecsCards3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 96,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 96,
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
          const Positioned(
            left: 17,
            top: 7,
            child: SizedBox(
              width: 73,
              height: 80,
              child: Text(
                'Jenis\nBarang\nWarna\nUkuran\nBahan',
                style: TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  height: 1.82,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 108,
            top: 7,
            child: SizedBox(
              width: 3,
              height: 80,
              child: Text(
                ':\n:\n:\n:\n:',
                style: TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  height: 1.82,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 129,
            top: 7,
            child: SizedBox(
              width: 219,
              height: 80,
              child: Text(
                'Sisa Kain Jahit (Perca / Kain Potongan)\nBermotif\nBeragam\n(30 cm s.d 1 m)\nCampuran',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  height: 1.82,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
