import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tolbor_tovch.dart';
import 'hooson_sags.dart';
import 'payment_page.dart';

class CartItem {
  final String name;
  final String imagePath;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> cartItems = [
    CartItem(
      name: 'Чийгшүүлэгч тос',
      imagePath: 'assets/tos.jpg',
      price: 39900,
    ),
    CartItem(
      name: 'Зөөлөн тоглоом бар 30см',
      imagePath: 'assets/bar.jpg',
      price: 29900,
    ),
  ];

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const EmptyCartPage()),
        );
      });
      return Container(color: Colors.white);
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Сагс (${cartItems.length})',
          style: GoogleFonts.notoSans(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Stack(
                  children: [
                    Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.imagePath,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: GoogleFonts.notoSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${item.price.toStringAsFixed(0)}₮',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 36),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    setState(() {
                                      if (item.quantity > 1) {
                                        item.quantity--;
                                      } else {
                                        cartItems.removeAt(index);
                                        if (cartItems.isEmpty) {
                                          WidgetsBinding.instance.addPostFrameCallback((_) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const EmptyCartPage(),
                                              ),
                                            );
                                          });
                                        }
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  '${item.quantity}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    setState(() {
                                      item.quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 24,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            cartItems.removeAt(index);
                            if (cartItems.isEmpty) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EmptyCartPage(),
                                  ),
                                );
                              });
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          CartBottomSection(totalPrice: totalPrice),
        ],
      ),
    );
  }
}
