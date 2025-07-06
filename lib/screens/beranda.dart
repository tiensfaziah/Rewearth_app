import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/product_card.dart';
import '../screens/clothing_screen.dart';
import '../screens/product_detail1.dart';
import '../screens/product_detail2.dart';
import '../screens/product_detail3.dart';
import '../screens/product_detail4.dart';
import '../screens/donasi.dart';
import '../screens/voucher.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // ✅ HEADER biru
                Container(
                  padding: EdgeInsets.only(top: statusBarHeight),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF77A8FF), Color(0xFF4F7FFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(21.5),
                                  child: Image.asset('lib/assets/images/profile.png', width: 43, height: 43),
                                ),
                                const SizedBox(width: 6),
                                Image.asset('lib/assets/images/Coin.png', width: 21, height: 21),
                                const SizedBox(width: 6),
                                const Text(
                                  '2560',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                // ✅ navigasi ke notif
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/notif');
                                  },
                                  child: Image.asset('lib/assets/images/notif.png', width: 20, height: 20),
                                ),
                                const SizedBox(width: 22),
                                // ✅ navigasi ke chat
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/chat');
                                  },
                                  child: Image.asset('lib/assets/images/chat.png', width: 20, height: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hi, sahabat bumi!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Sudahkan bergerak\nuntuk menyelamatkan dunia?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                height: 1.35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),

                // ✅ MAIN CONTENT
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(17, 34, 17, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jelajahi lebih banyak pilihan',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SF Pro',
                          ),
                        ),
                        const SizedBox(height: 20),

                        // ✅ MENU IKON
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ClothingScreen()),
                                );
                              },
                              child: menuIcon('lib/assets/images/barter.png', 'Barter'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DonationScreensr()),
                                );
                              },
                              child: menuIcon('lib/assets/images/donasi.png', 'Donasi'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/takeback');
                              },
                              child: menuIcon('lib/assets/images/takeback.png', 'Take-Back'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/tantangan');
                              },
                              child: menuIcon('lib/assets/images/tantangan.png', 'Tantangan'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const PointsExchangeScreen()),
                                );
                              },
                              child: menuIcon('lib/assets/images/voucher.png', 'Voucher'),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Kategori',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SF Pro',
                            ),
                          ),
                        ),
                        const SizedBox(height: 11),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              kategoriCard('lib/assets/images/Kategori1.png', 'Baju'),
                              kategoriCard('lib/assets/images/kategori2.png', 'Celana'),
                              kategoriCard('lib/assets/images/kategori3.png', 'Kain'),
                              kategoriCard('lib/assets/images/kategori4.png', 'Rok'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Pakaian Terbaru',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'SF Pro',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ClothingScreen()),
                                );
                              },
                              child: const Text(
                                'Lihat Semua',
                                style: TextStyle(
                                  color: Color(0xFF888888),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'SF Pro',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.662,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProductDetailScreen()),
                                );
                              },
                              child: const ProductCard(
                                imageAsset: 'lib/assets/images/baju1.png',
                                title: 'vest pria',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProductDetailScreen2()),
                                );
                              },
                              child: const ProductCard(
                                imageAsset: 'lib/assets/images/baju2.png',
                                title: 'Ya Hoodie',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProductDetailScreen3()),
                                );
                              },
                              child: const ProductCard(
                                imageAsset: 'lib/assets/images/baju3.png',
                                title: 'Kain sisa',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProductDetailScreen4()),
                                );
                              },
                              child: const ProductCard(
                                imageAsset: 'lib/assets/images/baju4.png',
                                title: 'Jeans',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ✅ Bottom Navigation
          const Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: BottomNavigationWidget(currentIndex: 0),
          ),
        ],
      ),
    );
  }

  Widget menuIcon(String iconPath, String label) {
    return Column(
      children: [
        Image.asset(iconPath, width: 52, height: 52),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  static Widget kategoriCard(String imgPath, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imgPath, width: 77, height: 77, fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
