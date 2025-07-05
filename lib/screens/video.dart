import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Gambar latar lokal
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/video.png', // ganti dengan nama file lokalmu
              fit: BoxFit.cover,
            ),
          ),

          // ✅ Konten utama
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 77),

                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'For Your Earth',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        shadows: [
                          Shadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Color(0x40000000),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _iconButton('lib/assets/images/luv.png', 35, 35),
                      const SizedBox(height: 30),
                      _iconButton('lib/assets/images/comment.png', 35, 34),
                      const SizedBox(height: 30),
                      _iconButton('lib/assets/images/favorit.png', 38, 35),
                      const SizedBox(height: 30),
                      _iconButton('lib/assets/images/bagikan.png', 59, 59),
                    ],
                  ),
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),

          // ✅ Bottom Navigation
          const Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: BottomNavigationWidget(currentIndex: 1),
          ),
        ],
      ),
    );
  }

  Widget _iconButton(String assetPath, double width, double height) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            color: Color(0x40000000),
          ),
        ],
      ),
      child: Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
