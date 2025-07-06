import 'package:flutter/material.dart';
import '../widgets/donasi_card.dart';
import 'beranda.dart'; // pastikan import halaman beranda
import '../screens/kirimSR.dart';

class DonationScreensr extends StatelessWidget {
  const DonationScreensr({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= 640;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Header dengan gradient + panah + title + deskripsi
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 292,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xFF98A3F2),
                        Color(0xFF6A9CFD),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isSmallScreen ? 30 : 50),
                      bottomRight: Radius.circular(isSmallScreen ? 30 : 50),
                    ),
                  ),
                ),
                const Positioned(
                  top: 40,
                  left: 16,
                  child: _BackToHomeButton(),
                ),
                Positioned(
                  left: isSmallScreen ? 27 : 37,
                  top: 136,
                  child: Text(
                    'Donasi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 18 : 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Positioned(
                  left: isSmallScreen ? 27 : 37,
                  top: 164,
                  right: isSmallScreen ? 27 : 37,
                  child: Text(
                    'Kirimkan pakaianmu, bantu sesama dan berkontribusi untuk bumi!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ✅ Konten kartu donasi scrollable
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    DonationCard(
                      organizationName: 'Sedekah Rombongan',
                      description:
                      'Punya pakaian layak pakai yang sudah jarang dipakai? Yuk, sumbangkan lewat Sedekah Rombongan.',
                      imageAsset: 'lib/assets/images/SR.png',
                      isSmallScreen: true,
                    ),
                    SizedBox(height: 20),
                    DonationCard(
                      organizationName: 'Rumah Zakat Yogyakarta',
                      description:
                      'Donasikan ke Rumah Zakat Yogyakarta. Baju darimu bisa jadi berkah!',
                      imageAsset: 'lib/assets/images/rumahzakat.png',
                      isSmallScreen: true,
                    ),
                    SizedBox(height: 20),
                    DonationCard(
                      organizationName: 'Yayasan Sahabat Yatim',
                      description:
                      'Bantu adik-adik yatim dengan pakaian layak pakai. Pakaianmu bisa jadi senyum baru!',
                      imageAsset: 'lib/assets/images/yatim.png',
                      isSmallScreen: true,
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Panah kembali ke Beranda
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
