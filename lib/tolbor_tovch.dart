import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'payment_page.dart';

class CartBottomSection extends StatefulWidget {
  final double totalPrice;

  const CartBottomSection({super.key, required this.totalPrice});

  @override
  State<CartBottomSection> createState() => _CartBottomSectionState();
}

class _CartBottomSectionState extends State<CartBottomSection> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ---------------- Төлбөрийн дэлгэрэнгүй товч ----------------
          GestureDetector(
            onTap: () {
              setState(() {
                showDetails = !showDetails;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Төлбөрийн дэлгэрэнгүй',
                  style: GoogleFonts.notoSans(
                    fontSize: 15,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  showDetails
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.grey[700],
                  size: 20,
                ),
              ],
            ),
          ),

          // ---------------- Дэлгэрэнгүй хэсэг ----------------
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Нийт дүн:', style: TextStyle(fontSize: 15)),
                      Text(
                        '${widget.totalPrice.toStringAsFixed(0)}₮',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Хямдрал:', style: TextStyle(fontSize: 15)),
                      Text('0₮', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  const Divider(height: 16),
                ],
              ),
            ),
            crossFadeState: showDetails
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),

          // ---------------- Төлөх дүн ба товч ----------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Төлөх дүн:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                '${widget.totalPrice.toStringAsFixed(0)}₮',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Төлбөр төлөх товч
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // Төлбөрийн хуудас руу шилжих
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentPage(totalPrice: widget.totalPrice),
                ),
              );
            },
            child: Text(
              'Төлбөр төлөх',
              style: GoogleFonts.notoSans(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
