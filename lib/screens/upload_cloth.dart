import 'package:flutter/material.dart';
import '../widgets/back_button_widget.dart'; // ⬅️ pastikan file ini ada

class UploadClothingScreen extends StatefulWidget {
  const UploadClothingScreen({Key? key}) : super(key: key);

  @override
  State<UploadClothingScreen> createState() => _UploadClothingScreenState();
}

class _UploadClothingScreenState extends State<UploadClothingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _sizeController.dispose();
    _materialController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBackButton(), // ⬅️ tombol back

            // Isi halaman
            Container(
              constraints: const BoxConstraints(maxWidth: 480),
              margin: const EdgeInsets.only(top: 50), // supaya konten tidak ketimpa tombol back
              child: Column(
                children: [
                  // Title
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text(
                      'Unggah Pakaian',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),

                  // Main content
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 26),
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Photo upload section
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.add_a_photo,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 27),
                                const Expanded(
                                  child: Text(
                                    'Tambahkan Foto',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Nama Barang
                            const SizedBox(height: 26),
                            _buildInputLabel('Nama Barang'),
                            _buildTextField(_nameController, 'contoh: vest pria'),

                            // Deskripsi Singkat Barang
                            const SizedBox(height: 15),
                            _buildInputLabel('Deskripsi Singkat Barang'),
                            _buildTextField(
                              _descriptionController,
                              'masukkan deskripsi singkat barang',
                              maxLines: 3,
                              customPadding: const EdgeInsets.fromLTRB(28, 14, 28, 58),
                            ),

                            // Ukuran
                            const SizedBox(height: 15),
                            _buildInputLabel('Ukuran'),
                            _buildTextField(_sizeController, 'contoh: M/L'),

                            // Bahan
                            const SizedBox(height: 15),
                            _buildInputLabel('Bahan'),
                            _buildTextField(_materialController, 'contoh: Katun'),

                            // Warna
                            const SizedBox(height: 15),
                            _buildInputLabel('Warna'),
                            _buildTextField(_colorController, 'contoh: Hitam'),

                            // Upload Button
                            const SizedBox(height: 23),
                            Container(
                              width: double.infinity,
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
                              child: ElevatedButton(
                                onPressed: _handleUpload,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF6A9CFD),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 70,
                                    vertical: 16,
                                  ),
                                ),
                                child: const Text(
                                  'Upload',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        height: 2,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {int maxLines = 1, EdgeInsetsGeometry? customPadding}) {
    return Container(
      width: 353,
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
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
          border: InputBorder.none,
          contentPadding: customPadding ??
              const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
        ),
      ),
    );
  }

  void _handleUpload() {
    final formData = {
      'name': _nameController.text,
      'description': _descriptionController.text,
      'size': _sizeController.text,
      'material': _materialController.text,
      'color': _colorController.text,
    };

    print('Upload data: $formData');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil diupload!'),
        backgroundColor: Color(0xFF6A9CFD),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, '/beranda', (route) => false);
    });
  }
}
