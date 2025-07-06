import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String placeholder;
  final VoidCallback? onFilterTap;

  const CustomSearchBar({
    Key? key,
    this.placeholder = 'Cari Barang',
    this.onFilterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: const Color(0xFFE1DFDF)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 19),
                  Container(
                    width: 17,
                    height: 18,
                    child: const Icon(
                      Icons.search,
                      size: 17,
                      color: Color(0xFF888888),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      placeholder,
                      style: const TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              width: 30,
              height: 34,
              child: const Icon(
                Icons.tune,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
