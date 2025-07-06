import 'package:flutter/material.dart';
import '../widgets/kameraTB_widget.dart';
import 'kode_donasi2.dart'; // import halaman donasi2

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
                  padding: const EdgeInsets.only(bottom: 100),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(maxWidth: 480),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                        child: const Column(
                          children: [
                            KameratbWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // ✅ Tombol panah kembali (posisi atas kiri, tidak ketimpa)
                const Positioned(
                  top: 40,
                  left: 16,
                  child: _BackToDonasiCodeButton(),
                ),

                // ✅ Tombol Ambil Foto di bawah
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
                        Navigator.pushNamed(context, '/camerareal');
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

// ✅ Komponen tombol panah kembali
class _BackToDonasiCodeButton extends StatelessWidget {
  const _BackToDonasiCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DonationShippingCodeScreen2()),
        );
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
        size: 24,
      ),
    );
  }
}
