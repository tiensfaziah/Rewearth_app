import 'dart:io'; // ✅ TAMBAHAN
import 'package:cloud_firestore/cloud_firestore.dart'; // ✅ TAMBAHAN
import 'package:firebase_auth/firebase_auth.dart'; // ✅ TAMBAHAN
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
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    _loadUserProducts(); // ✅ TAMBAHAN
  }

  Future<void> _loadUserProducts() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('userId', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .get();

    setState(() {
      products = snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'id': doc.id,
          'image': data['imagePath'] ?? '',
          'title': data['name'] ?? '',
          'createdAt': data['createdAt'],
        };
      }).toList();
    });
  }

  void _deleteProduct(int index) async {
    final id = products[index]['id'];
    await FirebaseFirestore.instance.collection('products').doc(id).delete();
    setState(() {
      products.removeAt(index);
    });
  }

  String _getTimeAgo(Timestamp timestamp) {
    final now = DateTime.now();
    final date = timestamp.toDate();
    final difference = now.difference(date);

    if (difference.inDays >= 1) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inMinutes}m ago';
    }
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
                  imagePath: item['image'],
                  title: item['title'],
                  timeAgo: _getTimeAgo(item['createdAt']),
                  onDelete: () => _deleteProduct(index),
                  isLocal: true,
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