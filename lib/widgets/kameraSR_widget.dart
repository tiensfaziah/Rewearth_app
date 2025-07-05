import 'package:flutter/material.dart';

class DonationContentWidget extends StatelessWidget {
  const DonationContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),

        // Title
        const Text(
          'Donasi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 22),

        // ✅ Logo SR + Teks Sedekah Rombongan (sejajar)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/SR.png',
              width: 73,
              height: 73,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            const Text(
              'Sedekah Rombongan',
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
