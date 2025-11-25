import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int count;
  const StarRating({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {//5 od
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

    path.moveTo(size.width * 0.5, 0);//deed oroi 8,0
    path.lineTo(size.width * 0.6, size.height * 0.4); //9.6 ,6.4 baruun deed hajuugiin tsegruu shugam tatna
    path.lineTo(size.width, size.height * 0.4);//16 , 6.4 baruun deed taliin irmeg
    path.lineTo(size.width * 0.7, size.height * 0.6);//11.2, 9.6 baruun dood
    path.lineTo(size.width * 0.8, size.height);//12.8, 16 baruun dood oroi
    path.lineTo(size.width * 0.5, size.height * 0.75);//8, 12 dood tuv
    path.lineTo(size.width * 0.2, size.height);//3.2, 16 zuun dood oroi
    path.lineTo(size.width * 0.3, size.height * 0.6);//4.8, 9.6 zuun dood
    path.lineTo(0, size.height * 0.4);//0, 6.4 zuun deed taliin irmeg
    path.lineTo(size.width * 0.4, size.height * 0.4);//6.4, 6.4 //zuun deed

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}