import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/tantangan_card2.dart';
import '../models/challenge.dart';
import 'beranda.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ✅ Biar status bar transparan & ikon putih
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    final challenges = [
      Challenge(
        id: '1',
        title: 'Tukar Barang',
        description: 'Tukarkan 1 barang dan dapatkan 5000 poin!',
        imageUrl: 'lib/assets/images/uniqlo.png',
        progress: 0.0,
        points: 5000,
      ),
      Challenge(
        id: '2',
        title: 'Donasi Barang',
        description: 'Donasikan barangmu 1x dan dapatkan 5000 poin!',
        imageUrl: 'lib/assets/images/uniqlo.png',
        progress: 0.0,
        points: 5000,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Background Header
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: screenWidth,
              height: 292,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xFF98A3F2),
                    Color(0xFF6A9CFD),
                  ],
                  stops: [0.0011, 0.9989],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),

          // ✅ Tombol Panah Back
          const Positioned(
            top: 40,
            left: 16,
            child: _BackToHomeButton(),
          ),

          // ✅ Judul
          Positioned(
            left: screenWidth > 640 ? 36 : 30,
            top: 136,
            child: const Text(
              'Tantangan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
          ),

          // ✅ Subtitle
          Positioned(
            left: screenWidth > 640 ? 36 : 30,
            top: 164,
            right: 30,
            child: const Text(
              'Selesaikan tantangan dan raih lebih banyak poin!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          ),

          // ✅ Daftar Tantangan
          Positioned.fill(
            top: 280, // ✅ DITURUNKAN agar tidak tabrakan
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  ChallengeCard(challenge: challenges[0]),
                  ChallengeCard(challenge: challenges[1]),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Komponen Tombol Panah Back
class _BackToHomeButton extends StatelessWidget {
  const _BackToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Beranda()),
        );
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
