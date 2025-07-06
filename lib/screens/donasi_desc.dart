import 'package:flutter/material.dart';
import 'package:rewearth/screens/kirimSR.dart';
import '../widgets/weight_selector_SR.dart';

class DonationDescriptionScreenSR extends StatefulWidget {
  const DonationDescriptionScreenSR({Key? key}) : super(key: key);

  @override
  State<DonationDescriptionScreenSR> createState() =>
      _DonationDescriptionScreenSRState();
}

class _DonationDescriptionScreenSRState
    extends State<DonationDescriptionScreenSR> {
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
                            // ✅ Panah back aman di dalam scrollable
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const CaraMengirimBarangScreen()),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),

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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/assets/images/SR.png',
                                  width: 73,
                                  height: 73,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 11),
                                const Text(
                                  'Sedekah Rombongan',
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

                // ✅ Tombol bawah "Dapatkan Kode"
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 2,
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
