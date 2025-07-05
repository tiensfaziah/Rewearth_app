import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final String brandName;
  final String description;
  final String imageAsset; // Ganti imageUrl menjadi imageAsset
  final VoidCallback? onTap;

  const BrandCard({
    Key? key,
    required this.brandName,
    required this.description,
    required this.imageAsset,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth > 640 ? screenWidth - 40 : screenWidth - 20;
    final leftPadding = screenWidth > 640 ? 20.0 : 10.0;

    return Container(
      width: cardWidth,
      margin: EdgeInsets.only(
        left: leftPadding,
        right: leftPadding,
        bottom: 20,
      ),
      child: Container(
        height: 154,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Brand logo (local image)
            Positioned(
              left: 16,
              top: 24,
              child: Container(
                width: 73,
                height: 73,
                child: Image.asset(
                  imageAsset,
                  width: 73,
                  height: 73,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Brand name
            Positioned(
              left: 108,
              top: 21,
              child: Text(
                brandName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            // Description
            Positioned(
              left: 108,
              top: 41,
              right: 10,
              child: Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  height: 2,
                ),
              ),
            ),
            // Divider line
            Positioned(
              left: 0,
              top: 117,
              child: Container(
                width: cardWidth,
                height: 1,
                color: const Color(0xFFE1DFDF),
              ),
            ),
            // Action button
            Positioned(
              right: 10,
              top: 125,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 118,
                  height: 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6A9CFD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Kirim Barangmu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
