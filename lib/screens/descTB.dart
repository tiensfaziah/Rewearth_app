import 'package:flutter/material.dart';
import '../widgets/weight_selector_SR.dart';

class DonationDescriptionScreenUniqlo extends StatefulWidget {
  const DonationDescriptionScreenUniqlo({Key? key}) : super(key: key);

  @override
  State<DonationDescriptionScreenUniqlo> createState() => _DonationDescriptionScreenUniqloState();
}

class _DonationDescriptionScreenUniqloState extends State<DonationDescriptionScreenUniqlo> {
  int weight = 0;
  final TextEditingController _descriptionController = TextEditingController();

  void _incrementWeight() {
    setState(() {
      weight++;
    });
  }

  void _decrementWeight() {
    setState(() {
      if (weight > 0) weight--;
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // ✅ Scrollable content
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(maxWidth: 480),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'Deskripsi Donasi',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            const SizedBox(height: 22),

                            // ✅ Ganti logo dan nama brand
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/assets/images/uniqlo.png',
                                  width: 73,
                                  height: 73,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 11),
                                const Text(
                                  'Re-Uniqlo',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),

                            const Text(
                              'Deskripsi Singkat Barang',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 10),

                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: TextFormField(
                                controller: _descriptionController,
                                maxLines: 5,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF666666),
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Masukkan deskripsi pakaian...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),

                            const Text(
                              'Berat Barang (kg)',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 11),

                            Padding(
                              padding: const EdgeInsets.only(left: 45.0),
                              child: WeightSelectorWidget(
                                weight: weight,
                                onIncrement: _incrementWeight,
                                onDecrement: _decrementWeight,
                              ),
                            ),

                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // ✅ Tombol ke halaman kode donasi
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 5, // bisa sesuaikan lagi kalau mau naik/turun
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/donation_code');
                    },
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
                      child: const Center(
                        child: Text(
                          'Dapatkan Kode',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
