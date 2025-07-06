import 'package:flutter/material.dart';

class IPhoneSplashScreen extends StatelessWidget {
  const IPhoneSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 393),
      height: 852,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          // Gradient text
          Positioned(
            left: 56,
            top: 382,
            child: SizedBox(
              width: 281,
              height: 44,
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF9135DF), Color(0xFF617CDD)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: const Text(
                  'Pakai ulang, kurangi sampah, selamatkan bumi.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none, // ⛔ hilangin garis bawah
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 22 / 15,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // Start button
          Positioned(
            left: 20,
            top: 746,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Container(
                width: 353,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6A9CFD), Color(0xFF987FF9)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Mulai',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.none, // ⛔ hilangin underline juga
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 22 / 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Logo image (pakai asset lokal)
          Positioned(
            left: 68,
            top: 315,
            child: SizedBox(
              width: 257,
              height: 67,
              child: Image.asset(
                'lib/assets/images/logoAPK2.png', // ← pastikan file ini ada & sudah di-declare di pubspec.yaml
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
