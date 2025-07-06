import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/tantangan_card.dart';
import '../widgets/bottom_navigation.dart';
import '../screens/setting.dart' as local;
import '../screens/tantangan.dart';
import '../screens/detail_tantangan.dart';
import '../models/challenge.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Future<DocumentSnapshot> getUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // 👉 contoh data dummy untuk challenge
    final challenges = [
      Challenge(
        id: '1',
        title: 'Tukar Barang',
        description: 'Tukarkan 1 barang dan dapatkan 5000 poin!',
        imageUrl: 'lib/assets/images/uniqlo.png',
        progress: 0.0,
        points: 5000,
      ),
      Challenge(
        id: '2',
        title: 'Donasi Barang',
        description: 'Donasikan barangmu 1x dan dapatkan 5000 poin!',
        imageUrl: 'lib/assets/images/uniqlo.png',
        progress: 0.0,
        points: 5000,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<DocumentSnapshot>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('Data pengguna tidak ditemukan'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;
          final nama = data['nama'] ?? 'Nama tidak tersedia';
          final email = data['email'] ?? 'Email tidak tersedia';
          final points = data['points'] ?? 0;

          return Stack(
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
                                    builder: (context) => const local.Settings(),
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

                      Text(
                        nama,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: const TextStyle(
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
                          Text(
                            '$points poin',
                            style: const TextStyle(
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
                          children: [
                            // ✅ Lihat Semua bisa diklik
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Tantangan',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'SF Pro',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const ChallengeScreen(),
                                      ),
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
                            const SizedBox(height: 15),

                            // ✅ Klik kartu ➜ Detail
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChallengeDetailScreen(
                                      challenge: challenges[0],
                                    ),
                                  ),
                                );
                              },
                              child: const ChallengeCard(
                                title: 'Tukarkan 1 barang dan dapatkan 5000 poin!',
                                progressText: '0%',
                                progressValue: 0.0,
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChallengeDetailScreen(
                                      challenge: challenges[1],
                                    ),
                                  ),
                                );
                              },
                              child: const ChallengeCard(
                                title: 'Donasikan barangmu 1x dan dapatkan 5000 poin!',
                                progressText: '0%',
                                progressValue: 0.0,
                              ),
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
          );
        },
      ),
    );
  }
}
