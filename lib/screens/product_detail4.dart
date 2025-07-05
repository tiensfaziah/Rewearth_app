import 'package:flutter/material.dart';

class ProductDetailScreen4 extends StatelessWidget {
  const ProductDetailScreen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1DFDF),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // ✅ Konten utama scrollable
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Gambar utama + judul overlay
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 481,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/assets/images/baju4.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 134,
                          top: 77,
                          child: Text(
                            'Detail Barang',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // ✅ Nama produk + New • For You
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Jeans',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'New • For You',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ✅ Ikon love
                    const Padding(
                      padding: EdgeInsets.only(right: 25, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                          size: 26,
                        ),
                      ),
                    ),

                    // ✅ Spesifikasi produk
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(17),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 73,
                            child: Text(
                              'Jenis Barang\nWarna\nUkuran\nBahan',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          SizedBox(width: 18),
                          SizedBox(
                            width: 3,
                            child: Text(
                              ':\n:\n:\n:',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          SizedBox(width: 18),
                          Expanded(
                            child: Text(
                              'Celana jeans kekinian\nBiru dongker\nM\nDenim tebal dan tahan lama',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ✅ Deskripsi produk
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(17, 12, 18, 12),
                      margin: const EdgeInsets.only(top: 7),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deskripsi Produk',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Celana jeans ini cocok untuk tampilan santai maupun semi-formal. Kombinasikan dengan kemeja atau kaos favoritmu. Ukuran standar Asia, nyaman dipakai dan awet.',
                            style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 100), // Jarak untuk tombol bawah
                  ],
                ),
              ),

              // ✅ Tombol tetap di bawah (tidak scroll)
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6A9CFD),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6A9CFD),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              'Chat Pemilik',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
