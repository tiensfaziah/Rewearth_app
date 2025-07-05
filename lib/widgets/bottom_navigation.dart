import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex; // ✅ untuk menentukan item aktif

  const BottomNavigationWidget({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.gradientEnd,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: _buildHomeIcon(),
            label: 'Beranda',
            index: 0,
            context: context,
          ),
          _buildNavItem(
            icon: _buildVideoIcon(),
            label: 'Video',
            index: 1,
            context: context,
          ),
          _buildNavItem(
            icon: _buildFileIcon(),
            label: 'Riwayat',
            index: 2,
            context: context,
          ),
          _buildNavItem(
            icon: _buildPersonIcon(),
            label: 'Profile',
            index: 3,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required Widget icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () {
        if (currentIndex == index) return; // tidak melakukan apa pun jika sudah aktif
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/beranda');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/video');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/riwayat');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile'); //
            break;
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 21, height: 20, child: icon),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTextStyles.navLabel.copyWith(
              color: isActive ? Colors.yellow : Colors.white,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeIcon() =>
      CustomPaint(size: const Size(21, 20), painter: HomeIconPainter());

  Widget _buildVideoIcon() =>
      CustomPaint(size: const Size(19, 19), painter: VideoIconPainter());

  Widget _buildFileIcon() =>
      CustomPaint(size: const Size(19, 18), painter: FileIconPainter());

  Widget _buildPersonIcon() =>
      CustomPaint(size: const Size(19, 19), painter: PersonIconPainter());
}

// ------------------------ ICON PAINTERS ------------------------

class HomeIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.07);
    path.lineTo(size.width * 0.1, size.height * 0.45);
    path.lineTo(size.width * 0.1, size.height * 0.9);
    path.lineTo(size.width * 0.4, size.height * 0.9);
    path.lineTo(size.width * 0.4, size.height * 0.65);
    path.lineTo(size.width * 0.6, size.height * 0.65);
    path.lineTo(size.width * 0.6, size.height * 0.9);
    path.lineTo(size.width * 0.9, size.height * 0.9);
    path.lineTo(size.width * 0.9, size.height * 0.45);
    path.lineTo(size.width * 0.5, size.height * 0.07);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class VideoIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, size.height * 0.3, size.width * 0.7, size.height * 0.6),
      const Radius.circular(3),
    );
    canvas.drawRRect(rect, paint);

    final path = Path();
    path.moveTo(size.width * 0.7, size.height * 0.4);
    path.lineTo(size.width * 0.95, size.height * 0.25);
    path.lineTo(size.width * 0.95, size.height * 0.75);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FileIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.2, 0, size.width * 0.6, size.height),
      const Radius.circular(2),
    );
    canvas.drawRRect(rect, paint);

    final linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < 4; i++) {
      final y = size.height * 0.3 + (i * size.height * 0.15);
      canvas.drawLine(
        Offset(size.width * 0.3, y),
        Offset(size.width * 0.7, y),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PersonIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.3),
      size.width * 0.15,
      paint,
    );

    final bodyPath = Path();
    bodyPath.moveTo(size.width * 0.2, size.height * 0.9);
    bodyPath.quadraticBezierTo(
      size.width * 0.2, size.height * 0.6,
      size.width * 0.5, size.height * 0.6,
    );
    bodyPath.quadraticBezierTo(
      size.width * 0.8, size.height * 0.6,
      size.width * 0.8, size.height * 0.9,
    );
    bodyPath.close();

    canvas.drawPath(bodyPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
