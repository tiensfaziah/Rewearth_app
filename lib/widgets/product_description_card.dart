import 'package:flutter/material.dart';

class ProductDescriptionCard extends StatelessWidget {
  const ProductDescriptionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 197,
      margin: const EdgeInsets.only(top: 7),
      child: Stack(
        children: [
          // Background card
          Container(
            width: double.infinity,
            height: 197,
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
          // Title
          const Positioned(
            left: 17,
            top: 0,
            child: Text(
              'Deskripsi',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                height: 3.64, // 51px line height / 14px font size
              ),
            ),
          ),
          // Description text
          const Positioned(
            left: 18,
            top: 45,
            right: 18,
            child: Text(
              'Vest ini cocok untuk tampilan kasual atau semi-formal. Terdapat beberapa kantong multifungsi di bagian depan, cocok untuk gaya streetwear atau outdoor. Nyaman dipakai dan ringan. Jarang dipakai, disimpan dengan baik.',
              style: TextStyle(
                color: Color(0xFF888888),
                fontSize: 11,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                height: 1.82, // 20px line height / 11px font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
