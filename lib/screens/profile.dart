import 'package:flutter/material.dart';
import '../widgets/tantangan_card.dart';
import '../widgets/bottom_navigation.dart';
import '../screens/setting.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Background biru & konten utama
          SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: screenHeight),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF6A9CFD), Color(0xFF4A7BF7)],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // ✅ Header
                  Stack(
                    children: [
                      const Center(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'lib/assets/images/settings.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ✅ Foto profil dan tombol edit
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'lib/assets/images/profile.png',
                          width: 88,
                          height: 88,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: MediaQuery.of(context).size.width * 0.32,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                              'lib/assets/images/edit.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'El Tijimi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'eltimiji707197@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/Coin.png',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '2560 poin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // ✅ Konten Tantangan
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    padding: const EdgeInsets.fromLTRB(19, 32, 19, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tantangan',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'SF Pro',
                              ),
                            ),
                            Text(
                              'Lihat Semua',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF Pro',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        ChallengeCard(
                          title: 'Tukarkan 1 barang dan dapatkan 5000 poin!',
                          progressText: '0%',
                          progressValue: 0.0,
                        ),
                        ChallengeCard(
                          title: 'Donasikan barangmu 1x dan dapatkan 5000 poin!',
                          progressText: '0%',
                          progressValue: 0.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ Bottom Navigation
          const Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: BottomNavigationWidget(currentIndex: 3),
          ),
        ],
      ),
    );
  }
}
