import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Main content
          Column(
            children: [
              const SizedBox(height: 50), // Padding atas (jika ingin)
              const Center(
                child: Text(
                  'Riwayat',
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
                    'Content area for Riwayat screen',
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

          // ✅ Bottom Navigation diposisikan sama seperti halaman lain
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
