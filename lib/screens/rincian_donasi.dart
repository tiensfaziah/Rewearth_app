import 'package:flutter/material.dart';

class DonationDetailsScreen extends StatefulWidget {
  const DonationDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DonationDetailsScreen> createState() => _DonationDetailsScreenState();
}

class _DonationDetailsScreenState extends State<DonationDetailsScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Tombol di bawah
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF6A9CFD),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            final desc = descriptionController.text.trim();
            final qty = quantityController.text.trim();

            if (desc.isEmpty || qty.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Harap isi semua kolom')),
              );
              return;
            }

            // Navigasi ke halaman verifikasi
            Navigator.pushNamed(context, '/verifikasi');
          },
          child: const Center(
            child: Text(
              'Kirim Barang',
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

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                const Center(
                  child: Text(
                    'Rincian Donasi',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'Detail Barang',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),

                const SizedBox(height: 15),

                // Gambar barang lokal
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('lib/assets/images/preview.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Deskripsi Singkat Barang',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 2,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Contoh: Baju dan celana anak-anak layak pakai...',
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Jumlah Barang (pcs)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 2,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                  child: TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Contoh: 10',
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'Detail Reward',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),

                const SizedBox(height: 8),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Point',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        height: 2,
                      ),
                    ),
                    Text(
                      '5000',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        height: 2,
                      ),
                    ),
                  ],
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Voucher',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        height: 2,
                      ),
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        height: 2,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                const Text(
                  'Reward akan dikirim setelah barang sampai dan dikonfirmasi oleh pihak Rewearth.',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
