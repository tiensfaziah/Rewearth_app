import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/product_grid.dart';
import '../screens/upload_cloth.dart';

class ClothingScreen extends StatelessWidget {
  const ClothingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔙 TOMBOL BACK
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context); // kembali ke Beranda
                  },
                ),
              ),

              // ✅ TITLE
              const Center(
                child: Text(
                  'Pakaian',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // ✅ CONTENT
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SearchBarWidget(),
                      ),

                      const SizedBox(height: 15),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ProductGrid(),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ✅ TOMBOL PLUS
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UploadClothingScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xFF6A9CFD),
        child: const Icon(Icons.add, color: Colors.white),
        elevation: 4,
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
