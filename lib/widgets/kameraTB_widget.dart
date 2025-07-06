import 'package:flutter/material.dart';

class KameratbWidget extends StatelessWidget {
  const KameratbWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),

        // Title
        const Text(
          'Takeback',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 22),

        // ✅ Logo Uniqlo + Teks Re-Uniqlo
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/uniqlo.png',
              width: 73,
              height: 73,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            const Text(
              'Re-Uniqlo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Deskripsi singkat
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            'Ambil foto paket yang akan dikirim, perlihatkan kode yang telah ditulis dan ditempelkan dengan jelas pada paket.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
