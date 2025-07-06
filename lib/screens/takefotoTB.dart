import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custombuttonSR.dart';
import 'kameraTB.dart'; // ⬅️ Import halaman sebelumnya

class TakeFotoTB extends StatelessWidget {
  const TakeFotoTB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sembunyikan status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: Stack(
          children: [
            // ✅ Background
            Positioned(
              left: 0,
              top: 0,
              child: SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Image.asset(
                  'lib/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // ✅ Panah Back
            const Positioned(
              top: 40,
              left: 16,
              child: _BackToKameraTBButton(),
            ),

            // ✅ Title "Donasi"
            Positioned(
              left: screenWidth * 0.42,
              top: 40,
              child: const SizedBox(
                width: 61,
                height: 22,
                child: Text(
                  'Donasi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 1.29,
                  ),
                ),
              ),
            ),

            // ✅ Background bawah
            Positioned(
              left: 0,
              top: screenHeight - 115,
              child: Container(
                width: screenWidth,
                height: 115,
                color: Colors.white,
              ),
            ),

            // ✅ Preview foto
            Positioned(
              left: 33,
              top: 264,
              child: SizedBox(
                width: screenWidth - 66,
                height: 219,
                child: Image.asset(
                  'lib/assets/images/preview.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // ✅ Kode
            Positioned(
              left: 47,
              top: 353,
              child: SizedBox(
                width: screenWidth - 94,
                height: 21,
                child: Text(
                  '123456ABC',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth < 640 ? 36 : 48,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 5,
                    height: 0.44,
                  ),
                ),
              ),
            ),

            // ✅ Tombol Foto Ulang
            Positioned(
              left: 20,
              top: screenHeight - 70,
              child: CustomButton(
                width: (screenWidth - 50) / 2,
                height: 50,
                text: 'Foto Ulang',
                backgroundColor: Colors.white,
                textColor: const Color(0xFF6A9CFD),
                borderColor: const Color(0xFF6A9CFD),
                onPressed: () {
                  Navigator.pop(context); // kembali ke kamera
                },
              ),
            ),

            // ✅ Tombol Gunakan Foto
            Positioned(
              right: 20,
              top: screenHeight - 70,
              child: CustomButton(
                width: (screenWidth - 50) / 2,
                height: 50,
                text: 'Gunakan Foto',
                backgroundColor: const Color(0xFF6A9CFD),
                textColor: Colors.white,
                borderColor: Colors.transparent,
                onPressed: () {
                  Navigator.pushNamed(context, '/rincian_donasi');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Komponen tombol panah kembali
class _BackToKameraTBButton extends StatelessWidget {
  const _BackToKameraTBButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const KameraTBScreen()),
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
