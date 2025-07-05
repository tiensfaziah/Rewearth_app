import 'package:flutter/material.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Stack(
        children: [
          // Product title
          const Positioned(
            left: 0,
            top: 3,
            child: SizedBox(
              width: 127,
              height: 48,
              child: Text(
                'Ya Hoodie',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  height: 2.55,
                ),
              ),
            ),
          ),

          // New • For You label
          Positioned(
            right: 17,
            top: 0,
            child: SizedBox(
              width: 110,
              height: 36,
              child: Text(
                'New • For You',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Poppins',
                  height: 3.92,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Heart icon
          Positioned(
            right: 0,
            top: 53,
            child: SizedBox(
              width: 26,
              height: 26,
              child: CustomPaint(
                painter: HeartIconPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeartIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(12.7902, 4.6863);
    path.lineTo(11.6438, 3.42948);
    path.cubicTo(8.95306, 0.479278, 4.01919, 1.49735, 2.23814, 5.20642);
    path.cubicTo(1.40197, 6.95097, 1.21331, 9.46972, 2.74016, 12.6843);
    path.cubicTo(4.21105, 15.7794, 7.27113, 19.4868, 12.7902, 23.525);
    path.cubicTo(18.3092, 19.4868, 21.3677, 15.7794, 22.8402, 12.6843);
    path.cubicTo(24.367, 9.46802, 24.18, 6.95097, 23.3422, 5.20642);
    path.cubicTo(21.5611, 1.49735, 16.6273, 0.477572, 13.9365, 3.42778);
    path.lineTo(12.7902, 4.6863);
    path.close();

    path.moveTo(12.7902, 25.5799);
    path.cubicTo(-11.7241, 8.30158, 5.24227, -5.18409, 12.5088, 1.94926);
    path.cubicTo(12.6047, 2.04362, 12.6985, 2.14083, 12.7902, 2.24087);
    path.cubicTo(12.8802, 2.1402, 12.9741, 2.04348, 13.0715, 1.95097);
    path.cubicTo(20.3365, -5.1875, 37.3044, 8.29987, 12.7902, 25.5799);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
