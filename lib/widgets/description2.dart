import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 197,
      margin: const EdgeInsets.only(top: 7),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 9.302,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Container(
            width: 67,
            height: 52,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Deskripsi',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                height: 3.64,
              ),
            ),
          ),

          // Description text
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 45),
            child: const Text(
              'Model oversize, cocok untuk gaya santai atau casual. Ada kantong depan model kangaroo pocket dan tali penyesuai pada bagian hoodie. Cocok untuk dipakai saat cuaca dingin atau sekadar hangout.',
              style: TextStyle(
                color: Color(0xFF888888),
                fontSize: 11,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                height: 1.82,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
