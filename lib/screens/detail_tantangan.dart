import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/challenge.dart';
import '../screens/tantangan.dart';

class ChallengeDetailScreen extends StatelessWidget {
  final Challenge challenge;

  const ChallengeDetailScreen({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ✅ Status bar menyatu dengan header
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Background Header Gradasi
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: screenWidth,
              height: 292,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xFF98A3F2),
                    Color(0xFF6A9CFD),
                  ],
                  stops: [0.0011, 0.9989],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),

          // ✅ Panah Back ke halaman tantangan
          const Positioned(
            top: 40,
            left: 16,
            child: _BackToChallengeScreen(),
          ),

          // ✅ Judul, Deskripsi, Gambar (kartu atas)
          Positioned(
            left: screenWidth > 640 ? 24 : 20,
            right: 24,
            top: 130,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Gambar Tantangan
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    challenge.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // ✅ Judul + Deskripsi Tantangan
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tantangan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        challenge.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ✅ Konten: Penjelasan & Syarat
          Positioned.fill(
            top: 290,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Saatnya mulai langkah kecil untuk bumi yang lebih besar! Tukarkan minimal 1 pakaian milikmu melalui fitur "Barter" di aplikasi Rewearth. Kamu bebas memilih siapa pun pengguna yang ingin kamu ajak tukar, selama prosesnya berhasil dan disetujui kedua pihak. Setelah transaksi barter selesai, kamu akan mendapatkan 5000 Poin yang bisa kamu kumpulkan untuk ditukar dengan reward lainnya.',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Syarat dan Ketentuan',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Hanya berlaku untuk 1 penukaran pertama\n'
                        '• Proses barter harus selesai (approved) oleh kedua pengguna\n'
                        '• Barang yang ditukar harus layak pakai dan difoto dengan jelas',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ Tombol Ikuti Tantangan
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 24),
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
                  Navigator.pushNamed(context, '/clothing');
                },
                child: const Center(
                  child: Text(
                    'Ikuti Tantangan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Komponen Tombol Panah Back
class _BackToChallengeScreen extends StatelessWidget {
  const _BackToChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChallengeScreen()),
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
