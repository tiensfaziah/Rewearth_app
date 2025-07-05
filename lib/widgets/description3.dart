import 'package:flutter/material.dart';

class DescriptionCard3 extends StatelessWidget {
  const DescriptionCard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 197,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 197,
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
            top: 0,
            child: SizedBox(
              width: 67,
              height: 52,
              child: Text(
                'Deskripsi',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  height: 3.64,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 18,
            top: 45,
            child: SizedBox(
              width: 359,
              height: 60,
              child: Text(
                'Berisi potongan-potongan kain bekas menjahit dari berbagai proyek. Ada yang masih cukup besar untuk dijahit ulang jadi pouch, aksesoris, atau dekorasi DIY. Total berat 1 kg.',
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
        ],
      ),
    );
  }
}
