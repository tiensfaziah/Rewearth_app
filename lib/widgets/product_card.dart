import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;

  const ProductCard({
    Key? key,
    required this.imageAsset,
    required this.title,
    this.subtitle = 'New • For You',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 150, // ✅ Lebar tetap agar scroll horizontal rapi
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageAsset,
              height: 180,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),

          // ✅ Card Body (title + subtitle + icons)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Title
                Text(
                  title,
                  style: AppTextStyles.productTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // ✅ Subtitle + icons row
                Row(
                  children: [
                    // Subtitle
                    Expanded(
                      child: Text(
                        subtitle,
                        style: AppTextStyles.productSubtitle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),

                    // Icons
                    Row(
                      children: [
                        Icon(Icons.chat_bubble_outline, size: 14, color: Colors.grey),
                        const SizedBox(width: 6),
                        Icon(Icons.favorite_border, size: 14, color: Colors.grey),
                        const SizedBox(width: 6),
                        Icon(Icons.bookmark_border, size: 14, color: Colors.grey),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
