import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String name;
  final String price;
  final int rating;

  const Product({required this.name, required this.price, required this.rating, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: const Center(child: Text('Зураг', style: TextStyle(color: Colors.black54))),
            ),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Text(price, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 20,
              child: Row(
                children: List.generate(5, (index) => CustomPaint(
                  size: const Size(20, 20),
                  painter: _StarPainter(fill: index < rating),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StarPainter extends CustomPainter {
  final bool fill;
  _StarPainter({required this.fill});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = fill ? Colors.amber : Colors.grey[300]!
      ..style = PaintingStyle.fill;

    final path = Path();
    double w = size.width;
    double h = size.height;

    path.moveTo(w * 0.5, 0);
    path.lineTo(w * 0.618, h * 0.382);
    path.lineTo(w, h * 0.382);
    path.lineTo(w * 0.691, h * 0.618);
    path.lineTo(w * 0.809, h);
    path.lineTo(w * 0.5, h * 0.764);
    path.lineTo(w * 0.191, h);
    path.lineTo(w * 0.309, h * 0.618);
    path.lineTo(0, h * 0.382);
    path.lineTo(w * 0.382, h * 0.382);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}