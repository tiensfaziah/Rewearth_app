import 'package:flutter/material.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/kartuProdukmu.dart';
import '../screens/upload_cloth.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({Key? key}) : super(key: key);

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  List<Map<String, String>> products = [
    {
      'image': 'lib/assets/images/baju1.png',
      'title': 'Vest Pria',
      'time': '2h ago',
    },
    {
      'image': 'lib/assets/images/baju2.png',
      'title': 'Ya Hoodie',
      'time': '23h ago',
    },
    {
      'image': 'lib/assets/images/baju3.png',
      'title': 'Kain Sisa',
      'time': '2d ago',
    },
    {
      'image': 'lib/assets/images/baju4.png',
      'title': 'Jeans Bolong',
      'time': '6d ago',
    },
  ];

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: const Text(
          'Produkmu',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/Settings',
                  (route) => false,
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 80),
        child: Column(
          children: [
            CustomSearchBar(onFilterTap: () {}),
            const SizedBox(height: 41),
            Wrap(
              spacing: 16,
              runSpacing: 24,
              children: List.generate(products.length, (index) {
                final item = products[index];
                return ProductCard(
                  imagePath: item['image']!,
                  title: item['title']!,
                  timeAgo: item['time']!,
                  onDelete: () => _deleteProduct(index),
                );
              }),
            ),
          ],
        ),
      ),

      floatingActionButton: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF6A9CFD),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UploadClothingScreen()),
            );
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(
            Icons.add,
            size: 34,
            color: Color(0xFFE6E6E6),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
