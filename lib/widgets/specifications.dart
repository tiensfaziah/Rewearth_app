import 'package:flutter/material.dart';

class SpecificationsWidget extends StatelessWidget {
  const SpecificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 96,
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
      padding: const EdgeInsets.fromLTRB(17, 7, 17, 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Labels column
          SizedBox(
            width: 73,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Jenis Barang',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  'Warna',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  'Ukuran',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  'Bahan',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
              ],
            ),
          ),

          // Separator column
          Container(
            width: 3,
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.82,
                  ),
                ),
              ],
            ),
          ),

          // Values column
          Expanded(
            child: SizedBox(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Hoodie',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      height: 1.82,
                    ),
                  ),
                  Text(
                    'Biru Muda (Soft Blue)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      height: 1.82,
                    ),
                  ),
                  Text(
                    'L (fit to L–XL)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      height: 1.82,
                    ),
                  ),
                  Text(
                    'Katun fleece – lembut dan hangat',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      height: 1.82,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
