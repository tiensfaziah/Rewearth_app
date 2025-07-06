import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custombuttonSR.dart';
import 'camera_real_screen.dart';

class TakeFoto extends StatelessWidget {
  final String imagePath;

  const TakeFoto({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sembunyikan status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final imageFile = File(imagePath);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CameraRealScreen()),
        );
        return false;
      },
      child: Scaffold(
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
                child: _BackToCameraButton(),
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

              // ✅ Preview foto dari kamera asli
              Positioned(
                left: 33,
                top: 264,
                child: SizedBox(
                  width: screenWidth - 66,
                  height: 219,
                  child: imageFile.existsSync()
                      ? Image.file(
                    imageFile,
                    fit: BoxFit.cover,
                  )
                      : const Center(child: Text('Image not found')),
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const CameraRealScreen()),
                    );
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
                    Navigator.pushNamed(
                      context,
                      '/rincian_donasi',
                      arguments: imagePath, // ✅ kirim path ke halaman berikutnya
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Komponen panah kembali
class _BackToCameraButton extends StatelessWidget {
  const _BackToCameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CameraRealScreen()),
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
