import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 353),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color(0xFFE1DFDF),
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
              child: Row(
                children: [
                  Image.asset(
                    'lib/assets/images/Search.png',
                    width: 17,
                    height: 18,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Text(
                      'Cari Barang',
                      style: TextStyle(
                        color: const Color(0xFF888888),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        height: 2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Image.asset(
            'lib/assets/images/Filter.png', // ✅ Ubah sesuai file kamu
            width: 30,
            height: 34,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}