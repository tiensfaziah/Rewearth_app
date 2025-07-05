import 'package:flutter/material.dart';
import '../models/challenge.dart';
import '../screens/detail_tantangan.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;

  const ChallengeCard({
    Key? key,
    required this.challenge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth > 991
        ? screenWidth - 40
        : screenWidth > 640
        ? screenWidth - 20
        : screenWidth - 20;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChallengeDetailScreen(challenge: challenge),
          ),
        );
      },
      child: Container(
        width: cardWidth,
        height: 154,
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: screenWidth > 640 ? 20 : 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Garis bawah
            Positioned(
              left: 0,
              top: 117,
              child: Container(
                width: cardWidth,
                height: 1,
                color: const Color(0xFFE1DFDF),
              ),
            ),

            // Gambar Tantangan
            Positioned(
              left: 16,
              top: 24,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  challenge.imageUrl,
                  width: 73,
                  height: 73,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Deskripsi
            Positioned(
              left: 105,
              top: 24,
              right: 15,
              child: Text(
                challenge.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            // Progress bar background
            Positioned(
              left: 105,
              top: 85,
              child: Container(
                width: cardWidth - 130,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            // Progress bar fill
            if (challenge.progress > 0)
              Positioned(
                left: 105,
                top: 85,
                child: Container(
                  width: (cardWidth - 130) * challenge.progress,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6A9CFD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

            // Persentase
            Positioned(
              right: 15,
              top: 75,
              child: Text(
                '${(challenge.progress * 100).toInt()}%',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
