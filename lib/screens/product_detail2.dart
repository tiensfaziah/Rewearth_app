import 'package:flutter/material.dart';
import '../widgets/product_info2.dart';
import '../widgets/specifications.dart';
import '../widgets/description2.dart';
import '../widgets/action_buttons_widget.dart';

class ProductDetailScreen2 extends StatelessWidget {
  const ProductDetailScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1DFDF),
      body: SafeArea(
        // ✅ top: false dihapus supaya status bar bawaan tetap tampil
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Main content
              SingleChildScrollView(
                child: Column(
                  children: [
                    // Main image section
                    Container(
                      width: double.infinity,
                      height: 481,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/assets/images/baju2.png'), // ✅ Ganti pakai lokal
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Detail Barang title
                          Positioned(
                            left: 134,
                            top: 77,
                            child: Container(
                              width: 124,
                              height: 22,
                              alignment: Alignment.center,
                              child: const Text(
                                'Detail Barang',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Product info section
                    const ProductInfoWidget(),

                    // Specifications section
                    const SpecificationsWidget(),

                    // Description section
                    const DescriptionWidget(),

                    const SizedBox(height: 70),
                  ],
                ),
              ),

              // ✅ Hapus StatusBarWidget, tidak dipakai

              // Action buttons at bottom
              const Positioned(
                left: 17,
                bottom: 20,
                right: 17,
                child: ActionButtonsWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
