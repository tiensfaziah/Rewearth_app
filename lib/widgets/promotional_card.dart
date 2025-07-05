import 'package:flutter/material.dart';

class PromotionalCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String pointsRequired;
  final String exchangeText;
  final String discountLabel;
  final String discountPercentage;

  const PromotionalCard({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.pointsRequired,
    required this.exchangeText,
    required this.discountLabel,
    required this.discountPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 154,
      decoration: BoxDecoration(
        color: const Color(0xFFA77F67),
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
          // ✅ Gambar Voucher
          Positioned(
            left: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                imageAsset,
                width: 220,
                height: 154,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ✅ White Section bawah
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 38,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          color: Color(0xFFF39552),
                          size: 12,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          pointsRequired,
                          style: const TextStyle(
                            color: Color(0xFFF39552),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ✅ Label Diskon di kanan
          Positioned(
            right: 16,
            top: 29,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exchangeText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  discountLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  discountPercentage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
