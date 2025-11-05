import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int count;
  const StarRating({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return CustomPaint(
          size: const Size(16, 16),
          painter: _SimpleStarPainter(
            index < count ? Colors.amber : Colors.grey[300]!,
          ),
        );
      }),
    );
  }
}

class _SimpleStarPainter extends CustomPainter {
  final Color color;
  _SimpleStarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();

    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.6, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width * 0.7, size.height * 0.6);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.5, size.height * 0.75);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width * 0.3, size.height * 0.6);
    path.lineTo(0, size.height * 0.4);
    path.lineTo(size.width * 0.4, size.height * 0.4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}