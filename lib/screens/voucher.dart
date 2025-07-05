import 'package:flutter/material.dart';
import 'package:rewearth/screens/detail_voucher.dart'; // pastikan file ini ada
import '../widgets/promotional_card.dart';

class PointsExchangeScreen extends StatelessWidget {
  const PointsExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Stack(
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

              // ✅ Konten
              Column(
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

                  // ✅ Kartu Voucher dengan Navigasi
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
                        imageAsset: 'lib/assets/images/voucher-uniqlo.png', // pastikan path image valid
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
            ],
          ),
        ),
      ),
    );
  }
}
