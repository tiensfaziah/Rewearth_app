import 'package:flutter/material.dart';
import '../screens/kode_donasi2.dart';
import '../screens/takeback.dart';

class KirimTBUniqloScreen extends StatelessWidget {
  const KirimTBUniqloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Konten utama (scroll)
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 60),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 480),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20), // tambahkan sedikit ruang biar gak nabrak
                    const Text(
                      'Cara Mengirim Barang',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/images/uniqlo.png',
                          width: 73,
                          height: 73,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'Re-Uniqlo',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pilih Lokasi Drop Point',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    const DropPointCard(title: 'Uniqlo A'),
                    const DropPointCard(title: 'Uniqlo B'),

                    const SizedBox(height: 35),

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: screenWidth > 360 ? 300 : double.infinity,
                        child: const Text(
                          '1. Pilih pakaian Uniqlo yang ingin didonasikan.\n\n'
                              '2. Masukkan pakaian ke dalam kardus atau karung yang kuat. Pastikan tertutup rapat dan diberi label "Donasi Pakaian".\n\n'
                              '3. Kami akan memandu Anda memilih opsi pengiriman terbaik dan paling terjangkau. Anda akan mendapatkan resi untuk melacak paket Anda.\n\n'
                              '4. Antarkan ke jasa pengiriman yang telah kamu pilih.',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            height: 1.9,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),

          // ✅ Panah back di paling atas biar gak ketimpa
          const Positioned(
            top: 40,
            left: 16,
            child: _BackToTakeBackButton(),
          ),
        ],
      ),

      // ✅ Tombol bawah
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 23),
        child: _BottomSendButton(
          onTap: () {
            Navigator.pushNamed(context, '/donasi_desc_uniqlo');
          },
        ),
      ),
    );
  }
}

// ✅ Panah back
class _BackToTakeBackButton extends StatelessWidget {
  const _BackToTakeBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TakeBackScreen()),
        );
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
        size: 24,
      ),
    );
  }
}

// ✅ Tombol bawah
class _BottomSendButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BottomSendButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
        child: const Center(
          child: Text(
            'Kirim Barang',
            style: TextStyle(
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

// ✅ Drop Point Card
class DropPointCard extends StatelessWidget {
  final String title;

  const DropPointCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
      child: Row(
        children: [
          Image.asset(
            'lib/assets/images/drop_point.png',
            width: 23,
            height: 30,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontFamily: 'Poppins',
                color: Colors.black,
                height: 1.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
