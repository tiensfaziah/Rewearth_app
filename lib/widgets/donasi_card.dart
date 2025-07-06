import 'package:flutter/material.dart';
import '../screens/kirimSR.dart';

class DonationCard extends StatelessWidget {
  final String organizationName;
  final String description;
  final String imageAsset;
  final bool isSmallScreen;

  const DonationCard({
    super.key,
    required this.organizationName,
    required this.description,
    required this.imageAsset,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (organizationName == 'Sedekah Rombongan') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CaraMengirimBarangScreen(),
            ),
          );
        }
      },
      child: Container(
        width: double.infinity,
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
            // Garis pembatas
            Positioned(
              left: 0,
              right: 0,
              top: 117,
              child: Container(
                height: 1,
                color: const Color(0xFFE1DFDF),
              ),
            ),

            // Logo
            Positioned(
              left: isSmallScreen ? 12 : 16,
              top: isSmallScreen ? 20 : 24,
              child: Container(
                width: isSmallScreen ? 60 : 73,
                height: isSmallScreen ? 60 : 73,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Judul
            Positioned(
              left: isSmallScreen ? 88 : 108,
              top: isSmallScreen ? 18 : 21,
              right: 10,
              child: Text(
                organizationName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isSmallScreen ? 11 : 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            // Deskripsi
            Positioned(
              left: isSmallScreen ? 88 : 108,
              top: isSmallScreen ? 35 : 41,
              right: 10,
              child: Text(
                description,
                style: TextStyle(
                  color: const Color(0xFF888888),
                  fontSize: isSmallScreen ? 7 : 8,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
                maxLines: isSmallScreen ? 6 : 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Tombol Kirim Pakaian (non-interaktif, hanya visual)
            Positioned(
              right: isSmallScreen ? 5 : 9,
              top: 125,
              child: Container(
                width: isSmallScreen ? 90 : 105,
                height: isSmallScreen ? 18 : 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF6A9CFD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Kirim Pakaian',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 9 : 10,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
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
