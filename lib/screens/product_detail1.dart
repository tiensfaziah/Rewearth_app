import 'package:flutter/material.dart';
import '../widgets/product_specs_card.dart';
import '../widgets/product_description_card.dart';
import '../widgets/action_buttons_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1DFDF),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // ✅ Konten scrollable utama
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Gambar + teks overlay "Detail Barang"
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 481,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/assets/images/baju1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 77,
                          left: 134,
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
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                    // ✅ Nama produk + New For You
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Vest Pria',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'New • For You',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ✅ Spesifikasi
                    const ProductSpecsCard(),

                    // ✅ Deskripsi
                    const ProductDescriptionCard(),

                    const SizedBox(height: 100), // Spasi untuk tombol bawah
                  ],
                ),
              ),

              // ✅ Tombol tetap di bawah
              const Positioned(
                left: 0,
                right: 0,
                bottom: 20,
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
                    color: Colors.black,
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
