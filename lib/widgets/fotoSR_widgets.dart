import 'package:flutter/material.dart';

class PhotoButtonWidget extends StatelessWidget {
  const PhotoButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 353),
      margin: const EdgeInsets.only(bottom: 10), // 🔽 Tambahkan jarak ke bawah sedikit
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFF6A9CFD),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 3),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              // Ganti dengan aksi navigasi ke halaman berikutnya, misalnya:
              Navigator.pushNamed(context, '/next_screen'); // Atau sesuaikan route
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
                vertical: 16, // 🔽 Sedikit lebih kecil biar tombol nggak terlalu tinggi
              ),
              child: const Text(
                'Ambil Foto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
