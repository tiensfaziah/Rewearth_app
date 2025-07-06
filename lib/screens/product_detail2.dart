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
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // ✅ Konten Utama Scrollable
              SingleChildScrollView(
                child: Column(
                  children: [
                    // ✅ Gambar utama + teks overlay
                    Container(
                      width: double.infinity,
                      height: 481,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/assets/images/baju2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // ✅ Judul overlay
                          const Positioned(
                            left: 134,
                            top: 77,
                            child: Text(
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
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ✅ Info Produk
                    const ProductInfoWidget(),

                    // ✅ Spesifikasi
                    const SpecificationsWidget(),

                    // ✅ Deskripsi
                    const DescriptionWidget(),

                    const SizedBox(height: 70),
                  ],
                ),
              ),

              // ✅ Tombol di bawah tetap
              const Positioned(
                left: 17,
                bottom: 20,
                right: 17,
                child: ActionButtonsWidget(),
              ),

              // ✅ PANAH KEMBALI KE BERANDA
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/beranda',
                          (route) => false,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
