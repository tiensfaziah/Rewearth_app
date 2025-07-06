import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';

class chatScreen extends StatelessWidget {
  const chatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Main content
          Column(
            children: [
              const SizedBox(height: 50), // Padding atas
              const Center(
                child: Text(
                  'Pesan',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: Center(
                  child: Text(
                    'Content area for Pesan screen',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 90), // Spasi untuk BottomNavigation
            ],
          ),

          // ✅ Panah kembali ke halaman beranda
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/beranda',
                      (route) => false,
                );
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),

          // ✅ Bottom Navigation
          const Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: BottomNavigationWidget(currentIndex: 2),
          ),
        ],
      ),
    );
  }
}
