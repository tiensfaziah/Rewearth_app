import 'package:flutter/material.dart';

class VerificationSuccessScreen extends StatefulWidget {
  const VerificationSuccessScreen({Key? key}) : super(key: key);

  @override
  State<VerificationSuccessScreen> createState() => _VerificationSuccessScreenState();
}

class _VerificationSuccessScreenState extends State<VerificationSuccessScreen> {
  @override
  void initState() {
    super.initState();

    // Navigasi otomatis ke beranda setelah 3 detik
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/beranda');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= 640;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Barangmu berhasil diverifikasi!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: isSmallScreen ? 16 : 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
