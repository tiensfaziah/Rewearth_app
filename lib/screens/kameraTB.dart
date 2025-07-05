import 'package:flutter/material.dart';
import '../widgets/kameraTB_widget.dart'; // widget khusus Uniqlo/Re-Uniqlo

class KameraTBScreen extends StatelessWidget {
  const KameraTBScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // ✅ Konten scrollable
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 100), // supaya tidak ketimpa tombol
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(maxWidth: 480),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                        child: const Column(
                          children: [
                            KameratbWidget(), // isinya logo uniqlo + deskripsi
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // ✅ Tombol Ambil Foto
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 5,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6A9CFD),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x40000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        Navigator.pushNamed(context, '/takefoto');
                      },
                      child: const Center(
                        child: Text(
                          'Ambil Foto',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
