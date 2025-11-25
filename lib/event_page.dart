import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'star_rating.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ЭВЕНТ",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Big Picture Section
            Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/product4.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add navigation or action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFCC00),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Үргэлжлүүлэх",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Second Picture Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Онцлох эвентүүд",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/product3.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Products Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Эвенттэй холбоотой бүтээгдэхүүнүүд",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Products Grid using the same products from CategoryProductsPage
            _buildEventProductsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildEventProductsGrid() {
    // Using the same products from CategoryProductsPage with local images
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Алим',
        'price': '₮5,000',
        'rating': 4,
        'image': 'assets/images/products/apple.jpg',
      },
      {
        'name': 'Банан',
        'price': '₮3,500',
        'rating': 5,
        'image': 'assets/images/products/banana.jpg',
      },
      {
        'name': 'Улаан лооль',
        'price': '₮4,200',
        'rating': 4,
        'image': 'assets/images/products/tomato.jpg',
      },
      {
        'name': 'Төмс',
        'price': '₮2,800',
        'rating': 3,
        'image': 'assets/images/products/potato.jpg',
      },
      {
        'name': 'Сонгино',
        'price': '₮1,900',
        'rating': 4,
        'image': 'assets/images/products/onion.jpg',
      },
      {
        'name': 'Сармис',
        'price': '₮3,200',
        'rating': 5,
        'image': 'assets/images/products/garlic.jpg',
      },
      {
        'name': 'Хүрэн манжин',
        'price': '₮4,500',
        'rating': 4,
        'image': 'assets/images/products/cabbage.jpg',
      },
      {
        'name': 'Гүзээлзгэнэ',
        'price': '₮6,800',
        'rating': 5,
        'image': 'assets/images/products/strawberry.jpg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _buildProductCard(
            context,
            product['name'] as String,
            product['price'] as String,
            product['rating'] as int,
            product['image'] as String,
          );
        },
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context,
      String name,
      String price,
      int rating,
      String imagePath,
      ) {
    return GestureDetector(
      onTap: () {
        // Navigate to product details page
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag, color: Colors.grey[400], size: 40),
                          const SizedBox(height: 8),
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
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
                        fontSize: 14,
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
      ),
    );
  }
}