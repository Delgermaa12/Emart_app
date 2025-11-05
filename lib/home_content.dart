import 'package:flutter/material.dart';
import 'star_rating.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMenuIcon(Icons.home, "Нүүр"),
              _buildMenuIcon(Icons.search, "Хайлт"),
              _buildMenuIcon(Icons.shop, "Бараа"),
              _buildMenuIcon(Icons.person, "Профайл"),
            ],
          ),
        ),

        // submenu
        Container(
          height: 70,
          color: Colors.amber[100],
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSubMenuItem("Онцлох"),
              _buildSubMenuItem("Шинэ"),
              _buildSubMenuItem("Хямдрал"),
              _buildSubMenuItem("Бүгд"),
            ],
          ),
        ),

        // Main content
        Expanded(
          child: Container(
            color: const Color(0xFFF9F9F9),
            child: Column(
              children: [
                // News хэсэг
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  color: Colors.amber[50],
                  child: Row(
                    children: [
                      const Icon(Icons.local_offer, color: Colors.amber),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Шинэ жилийн хямдрал эхэллээ!",
                          style: const TextStyle(
                            fontSize: 20,           // хүссэн хэмжээ
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Products grid - FIXED
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85, // zurgand zoriulsan aspect ratio
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      padding: const EdgeInsets.only(bottom: 16),
                      children: [
                        _buildProduct("Серум", "₮50,000", 4, "assets/images/product1.png"),
                        _buildProduct("Тоглоом", "₮22,000", 5, "assets/images/product2.png"),
                        _buildProduct("Баннын бөмбөлөг", "₮5,000", 3, "assets/images/product3.png"),
                        _buildProduct("Чихмэл нохой", "₮,50,000", 4, "assets/images/product4.png"),
                        _buildProduct("Бамарууш чихмэл", "₮45,000", 5, "assets/images/product5.png"),
                        _buildProduct("Ном", "₮250,00", 2, "assets/images/product6.png"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuIcon(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.amber[700], size: 28),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
  Widget _buildSubMenuItem(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,           // хүссэн хэмжээ
        fontWeight: FontWeight.bold,
      ),
    );
  }
  Widget _buildProduct(String name, String price, int rating, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity, // Fill card width
        height: double.infinity, // Fill card height
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Product image
            Expanded( // bolomjtoi space deer image bairlana
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[100],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain, //zurgiig butneer ni bagtaah
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: Icon(Icons.shopping_bag, color: Colors.grey[400], size: 40),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Product  medeelel - FIXED
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.amber[700],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  StarRating(count: rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}