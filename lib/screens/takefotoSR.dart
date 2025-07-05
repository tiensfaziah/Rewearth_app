import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk status bar control
import '../widgets/custombuttonSR.dart';

class TakeFoto extends StatelessWidget {
  const TakeFoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menyembunyikan status bar
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
            // Background image
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                child: Image.asset(
                  'lib/assets/images/background.png',
                  fit: BoxFit.cover,
                  width: screenWidth,
                  height: screenHeight,
                ),
              ),
            ),

            // Title "Donasi"
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

            // Bottom white background
            Positioned(
              left: 0,
              top: screenHeight - 115,
              child: Container(
                width: screenWidth,
                height: 115,
                color: Colors.white,
              ),
            ),

            // Photo preview area
            Positioned(
              left: 33,
              top: 264,
              child: Container(
                width: screenWidth - 66,
                height: 219,
                child: Image.asset(
                  'lib/assets/images/preview.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Code text
            Positioned(
              left: 47,
              top: 353,
              child: Container(
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

            // Retake photo button
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
                onPressed: () {},
              ),
            ),

            // Use photo button
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
