import 'package:flutter/material.dart';
import 'kameraSR.dart';
import 'donasi_desc.dart';

class DonationShippingCodeScreen extends StatelessWidget {
  const DonationShippingCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none, // penting biar back button bisa nongol di atas
          children: [
            // ✅ Konten utama (scrollable)
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100, top: 60), // top ditambah biar gak nutupi panah
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Kode Pengiriman Donasi',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 30),

                      // ✅ Kode card
                      Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(maxWidth: 353),
                        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 22),
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: const Text(
                          '123456AB',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            letterSpacing: 5,
                            height: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Sebelum mengirimkan barang kamu, perhatikan hal-hal berikut:\n\n'
                              '• Kemas barangmu ke dalam dus/kemasan lainnya agar barang dapat dikirim dengan mudah dan aman sampai tujuan.\n'
                              '• Tulis dan Tempelkan Kode Pengiriman di atas paket.\n'
                              '• Ambil foto paketmu pada halaman berikutnya.\n'
                              '• Antar barang ke jasa pengiriman tanpa perlu membayar ongkos kirim.\n'
                              '• Tunggu verifikasi diterimanya barangmu.\n'
                              '• Dapatkan poin dan voucher dari Rewearth.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            height: 1.9,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ✅ Tombol lanjut di bawah
            Positioned(
              left: 0,
              right: 0,
              bottom: 21,
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF6A9CFD),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const KameraSRScreen()),
                    );
                  },
                  child: const Center(
                    child: Text(
                      'Lanjutkan',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ✅ Panah back di atas semua
            const Positioned(
              top: 16,
              left: 16,
              child: _BackButtonToDonasiDesc(),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Komponen tombol panah back
class _BackButtonToDonasiDesc extends StatelessWidget {
  const _BackButtonToDonasiDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DonationDescriptionScreenSR(),
          ),
        );
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        size: 20,
        color: Colors.black,
      ),
    );
  }
}
