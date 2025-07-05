import 'package:flutter/material.dart';

class ProductSpecsCard extends StatelessWidget {
  const ProductSpecsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 96,
      margin: const EdgeInsets.only(top: 7),
      child: Stack(
        children: [
          // Background card
          Container(
            width: double.infinity,
            height: 96,
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
          // Labels column
          const Positioned(
            left: 17,
            top: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jenis Barang',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82, // 20px line height / 11px font size
                  ),
                ),
                Text(
                  'Warna',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  'Ukuran',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  'Bahan',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
              ],
            ),
          ),
          // Colons
          const Positioned(
            left: 108,
            top: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
              ],
            ),
          ),
          // Values column
          const Positioned(
            left: 129,
            top: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vest / Rompi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  'Hitam (Black)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  'All Size / L',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  'Katun',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
