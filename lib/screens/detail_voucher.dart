import 'package:flutter/material.dart';
import 'package:rewearth/screens/voucher.dart'; // ← halaman voucher utama

class VoucherDetailScreen extends StatelessWidget {
  const VoucherDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // ✅ Konten scrollable
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 900),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 480),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Center(
                      child: Text(
                        'Detail Voucher',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _BannerImage(),
                    SizedBox(height: 20),
                    _VoucherDescription(),
                    SizedBox(height: 30),
                    _PointInfo(),
                    SizedBox(height: 40),
                    _TermsAndConditions(),
                  ],
                ),
              ),
            ),

            // ✅ Tombol tetap di bawah
            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).padding.bottom + 0,
              child: _BottomSendButton(
                label: 'Tukar Poin',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text(
                        'Berhasil!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      content: const Text(
                        'Poin kamu berhasil ditukar dengan voucher ini.',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/beranda',
                                  (route) => false,
                            );
                          },
                          child: const Text(
                            'Tutup',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ✅ Panah back ke halaman voucher utama
            const Positioned(
              top: 40,
              left: 16,
              child: _BackToVoucherScreenButton(),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Panah back konsisten
class _BackToVoucherScreenButton extends StatelessWidget {
  const _BackToVoucherScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PointsExchangeScreen()),
        );
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black, // karena background putih
        size: 24,
      ),
    );
  }
}

// ✅ komponen gambar banner
class _BannerImage extends StatelessWidget {
  const _BannerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage('lib/assets/images/voucher-uniqlo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ✅ deskripsi voucher
class _VoucherDescription extends StatelessWidget {
  const _VoucherDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Diskon 25% di Offline Store',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Gunakan voucher ini untuk mendapatkan potongan harga 25% di semua pembelian di Toko Hijau. Berlaku untuk semua produk tanpa minimum pembelian.',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
            color: Colors.black87,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

// ✅ info penukaran poin
class _PointInfo extends StatelessWidget {
  const _PointInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.stars_rounded, color: Color(0xFF6A9CFD)),
        SizedBox(width: 8),
        Text(
          'Tukar dengan 300000 Poin',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

// ✅ syarat dan ketentuan
class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Syarat dan Ketentuan:',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '• Voucher hanya berlaku untuk pembelian online.\n'
              '• Tidak dapat digabungkan dengan promo lain.\n'
              '• Penukaran poin bersifat final dan tidak dapat dikembalikan.\n'
              '• Berlaku sampai 31 Desember 2025.',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
            color: Colors.black87,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

// ✅ tombol tetap di bawah
class _BottomSendButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const _BottomSendButton({
    Key? key,
    required this.onTap,
    this.label = 'Tukar Poin',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
