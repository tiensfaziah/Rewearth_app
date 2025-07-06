import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TotalPoinScreen extends StatelessWidget {
  const TotalPoinScreen({Key? key}) : super(key: key);

  Future<int> getTotalPoints() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return 0;

    final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = snapshot.data();
    return data?['points'] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ✅ Header gradasi biru
              Container(
                width: double.infinity,
                height: 280,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color(0xFF98A3F2),
                      Color(0xFF6A9CFD),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 16,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 120),
                        child: Text(
                          'Total Poin Kamu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ✅ FutureBuilder untuk ambil poin
              FutureBuilder<int>(
                future: getTotalPoints(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(color: Color(0xFF6A9CFD));
                  }

                  final points = snapshot.data ?? 0;

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/images/Coin.png',
                          width: 48,
                          height: 48,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '$points Poin',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: Color(0xFF4A7BF7),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Ayo kumpulkan lebih banyak poin dan tukarkan dengan reward seru!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
