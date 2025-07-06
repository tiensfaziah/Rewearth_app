import 'package:flutter/material.dart';

class KategoriRokScreen extends StatelessWidget {
  const KategoriRokScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageList = List.generate(
      6,
          (_) => 'lib/assets/images/kategori4.png',
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A9CFD),
        elevation: 0,
        title: const Text(
          'Kategori Rok',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: imageList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageList[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
