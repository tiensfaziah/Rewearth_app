import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_colors.dart';
import '../screens/product_detail1.dart';
import '../screens/product_detail2.dart';
import '../screens/product_detail3.dart';
import '../screens/product_detail4.dart';

// ✅ import halaman kategori
import '../screens/kategori_baju_screen.dart';
import '../screens/kategori_celana_screen.dart';
import '../screens/kategori_kain_screen.dart';
import '../screens/kategori_rok_screen.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ Baris 1 - kategori kecil (klikable)
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 353),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryCard(
                imagePath: 'lib/assets/images/Kategori1.png',
                label: 'Baju',
                destination: const KategoriBajuScreen(),
              ),
              CategoryCard(
                imagePath: 'lib/assets/images/kategori2.png',
                label: 'Celana',
                destination: const KategoriCelanaScreen(),
              ),
              CategoryCard(
                imagePath: 'lib/assets/images/kategori3.png',
                label: 'Kain',
                destination: const KategoriKainScreen(),
              ),
              CategoryCard(
                imagePath: 'lib/assets/images/kategori4.png',
                label: 'Rok',
                destination: const KategoriRokScreen(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // ✅ Baris 2 - produk besar
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

        // ✅ Baris 3 - produk besar lainnya
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

// ✅ Kategori Kecil
class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final Widget destination;

  const CategoryCard({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destination),
        );
      },
      child: ClipRRect(
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
      ),
    );
  }
}

// ✅ Produk Besar
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
