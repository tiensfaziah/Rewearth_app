import 'package:flutter/material.dart';
import 'package:rewearth/screens/kameraTB.dart';
import 'package:rewearth/widgets/kameraTB_widget.dart';

class DonationShippingCodeScreen2 extends StatelessWidget {
  const DonationShippingCodeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // ✅ Konten scrollable
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 480),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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

                          // ✅ Kode
                          Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(maxWidth: 353),
                            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 22),
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

                          const Text(
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // ✅ Tombol lanjut di bawah, konsisten seperti halaman donasi desc
              Positioned(
                left: 0,
                right: 0,
                bottom: 22,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const KameraTBScreen()),
                    );
                  },
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
            ],
          );
        },
      ),
    );
  }
}
