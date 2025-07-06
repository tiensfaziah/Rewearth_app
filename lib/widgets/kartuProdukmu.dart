import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String timeAgo;
  final VoidCallback? onDelete;

  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.timeAgo,
    this.onDelete,
  }) : super(key: key);

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Produk'),
        content: const Text('Yakin ingin menghapus produk ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // tutup dialog
              if (onDelete != null) {
                onDelete!(); // panggil handler hapus
              }
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 169,
      height: 266,
      child: Column(
        children: [
          // gambar produk
          Container(
            width: 169,
            height: 207,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // info produk + tombol hapus
          Container(
            width: 168,
            height: 59,
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
                Positioned(
                  left: 9,
                  top: 5,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 5,
                  child: Text(
                    timeAgo,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 7,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                // ikon tempat sampah
                Positioned(
                  right: 6,
                  bottom: 7,
                  child: GestureDetector(
                    onTap: () => _showDeleteDialog(context),
                    child: const Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.red,
                    ),
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
