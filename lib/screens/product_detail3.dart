import 'package:flutter/material.dart';
import '../widgets/product_specs_cards3.dart';
import '../widgets/description3.dart';
import '../widgets/action_buttons_widget3.dart';

class ProductDetailScreen3 extends StatelessWidget {
  const ProductDetailScreen3({Key? key}) : super(key: key);

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
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 481,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/assets/images/baju3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 77,
                          left: 134,
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
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Kain Sisa',
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

                    const ProductSpecsCards3(),
                    const DescriptionCard3(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),

              const Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: ActionButtonsWidget3(),
              ),

              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/beranda',
                          (route) => false,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 24,
                    color: Colors.white,
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
