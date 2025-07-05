import 'package:flutter/material.dart';
import 'donasi_desc.dart'; // Pastikan ini mengarah ke file DonationDescriptionScreen

class CaraMengirimBarangScreen extends StatelessWidget {
  const CaraMengirimBarangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // ✅ Konten scrollable
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 480),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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

                    // ✅ Logo dan brand
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/images/SR.png',
                          width: 73,
                          height: 73,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'Sedekah Rombongan',
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

                    const DropPointCard(
                      title: 'Kantor Pusat Sedekah Rombongan (Jogja)',
                    ),
                    const DropPointCard(
                      title: 'Rumah Singgah Sedekah Rombongan Jogja',
                    ),

                    const SizedBox(height: 35),

                    // ✅ Langkah-langkah
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: screenWidth > 360 ? 300 : double.infinity,
                        child: const Text(
                          '1. Pilih pakaian yang bersih dan layak pakai. Kami sarankan Anda mengelompokkannya (misalnya, pakaian dewasa, anak-anak) untuk memudahkan proses selanjutnya.\n\n'
                              '2. Masukkan pakaian ke dalam kardus atau karung yang kuat. Pastikan tertutup rapat dan diberi label "Donasi Pakaian" agar paket Anda aman sampai tujuan.\n\n'
                              '3. Kami akan memandu Anda memilih opsi pengiriman terbaik dan paling terjangkau ke lokasi Sedekah Rombongan. Anda akan mendapatkan resi untuk melacak paket Anda.\n\n'
                              '4. Antarkan ke jasa pengiriman yang telah kamu pilih. Kirimkan pada alamat yang tertera.',
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

            // ✅ Tombol bawah seperti bottom navigation
            Positioned(
              left: 0,
              right: 0,
              bottom: 2,
              child: _BottomSendButton(
                onTap: () {
                  Navigator.pushNamed(context, '/donasi_desc');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSendButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BottomSendButton({Key? key, required this.onTap}) : super(key: key);

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
