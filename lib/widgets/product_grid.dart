import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_colors.dart';
import '../screens/product_detail1.dart'; // Detail 1
import '../screens/product_detail2.dart'; // Detail 2
import '../screens/product_detail3.dart'; // ✅ Detail 3 (baru ditambahkan)
import '../screens/product_detail4.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ Baris 1 - kategori kecil
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 353),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CategoryCard(imagePath: 'lib/assets/images/Kategori1.png', label: 'Baju'),
              CategoryCard(imagePath: 'lib/assets/images/kategori2.png', label: 'Celana'),
              CategoryCard(imagePath: 'lib/assets/images/kategori3.png', label: 'Kain'),
              CategoryCard(imagePath: 'lib/assets/images/kategori4.png', label: 'Rok'),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // ✅ Baris 2 - gambar besar
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 353),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              LargeProductCard(
                imagePath: 'lib/assets/images/baju1.png',
                title: 'Vest Pria',
              ),
              LargeProductCard(
                imagePath: 'lib/assets/images/baju2.png',
                title: 'Ya Hoodie',
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // ✅ Baris 3 - gambar besar lainnya
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 355),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              LargeProductCard(
                imagePath: 'lib/assets/images/baju3.png',
                title: 'Kain Sisa',
              ),
              LargeProductCard(
                imagePath: 'lib/assets/images/baju4.png',
                title: 'Jeans',
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryCard({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 77,
            height: 124,
            fit: BoxFit.cover,
          ),
          Container(
            width: 77,
            height: 124,
            color: Colors.black.withOpacity(0.25),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}

class LargeProductCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const LargeProductCard({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  void navigateToDetail(BuildContext context) {
    if (title == 'Vest Pria') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductDetailScreen()),
      );
    } else if (title == 'Ya Hoodie') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductDetailScreen2()),
      );
    } else if (title == 'Kain Sisa') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductDetailScreen3()),
      );
    } else if (title == 'Jeans') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductDetailScreen4()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToDetail(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 169,
              height: 228,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 169,
            child: Text(
              title,
              style: AppTextStyles.productTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(Icons.favorite_border, size: 14, color: Colors.grey),
              SizedBox(width: 6),
              Icon(Icons.bookmark_border, size: 14, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
