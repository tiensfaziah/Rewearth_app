import 'package:flutter/material.dart';
import '../widgets/brand_cardTB.dart';
import 'kirimTB.dart'; // Pastikan file ini sudah ada

class TakeBackScreen extends StatelessWidget {
  const TakeBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header background
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: screenWidth,
              height: 292,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  stops: [0.0011, 0.9989],
                  colors: [Color(0xFF98A3F2), Color(0xFF6A9CFD)],
                ),
              ),
            ),
          ),

          // Title
          Positioned(
            left: screenWidth > 640 ? 36 : screenWidth * 0.05,
            top: 100,
            child: const Text(
              'Take-Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
          ),

          // Description
          Positioned(
            left: screenWidth > 640 ? 36 : screenWidth * 0.05,
            top: 130,
            right: screenWidth * 0.05,
            child: const Text(
              'Kembalikan pakaian yang sudah tidak terpakai, dan dapatkan keuntungan!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          ),

          // Content list
          Positioned.fill(
            top: 220,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BrandCard(
                    brandName: 'Uniqlo',
                    description:
                    'Lewat program Re.UNIQLO, bajumu akan didaur ulang atau disumbangkan ke mereka yang membutuhkan.',
                    imageAsset: 'lib/assets/images/uniqlo.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const KirimTBUniqloScreen()),
                      );
                    },
                  ),
                  BrandCard(
                    brandName: 'H&M',
                    description:
                    'Melalui program Garment Collecting, H&M menerima semua jenis pakaian dari brand apapun untuk didaur ulang atau digunakan kembali.',
                    imageAsset: 'lib/assets/images/hm.png',
                  ),
                  BrandCard(
                    brandName: 'Zara',
                    description:
                    'Lewat Clothing Collection Program, kamu bisa bawa pakaian bekas layak pakai ke toko ZARA dan ikut bantu mereka yang membutuhkan.',
                    imageAsset: 'lib/assets/images/zara.png',
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
