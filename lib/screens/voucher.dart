import 'package:flutter/material.dart';
import 'package:rewearth/screens/detail_voucher.dart';
import '../widgets/promotional_card.dart';
import 'beranda.dart'; // pastikan import halaman beranda

class PointsExchangeScreen extends StatelessWidget {
  const PointsExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Background Gradasi Header
          Container(
            width: double.infinity,
            height: 292,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xFF98A3F2),
                  Color(0xFF6A9CFD),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),

          // ✅ Konten Scroll
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 130),
                const Text(
                  'Tukarkan Poinmu!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '2560',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 155),

                // ✅ Card Voucher
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VoucherDetailScreen(),
                        ),
                      );
                    },
                    child: const PromotionalCard(
                      imageAsset: 'lib/assets/images/voucher-uniqlo.png',
                      title: 'DISKON 30% DI UNIQLO INDONESIA',
                      pointsRequired: '300000 Poin',
                      exchangeText: 'Tukar 300000 Poin',
                      discountLabel: 'Diskon',
                      discountPercentage: '30%',
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),

          // ✅ Tombol Panah di Paling Atas
          const Positioned(
            top: 40,
            left: 16,
            child: _BackToHomeButton(),
          ),
        ],
      ),
    );
  }
}

// ✅ Tombol Panah Back
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
