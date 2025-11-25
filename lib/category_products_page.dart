import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'star_rating.dart';

class CategoryProductsPage extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcon;

  const CategoryProductsPage({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          categoryName,
          style: GoogleFonts.notoSans(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: _buildProductGrid(),
    );
  }

  Widget _buildProductGrid() {
    // Sample products for each category
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Алим',
        'price': '₮5,000',
        'rating': 4,
        'image': 'https://via.placeholder.com/150/FF6B6B/FFFFFF?text=Алим',
      },
      {
        'name': 'Банан',
        'price': '₮3,500',
        'rating': 5,
        'image': 'https://via.placeholder.com/150/FECA57/FFFFFF?text=Банан',
      },
      {
        'name': 'Улаан лооль',
        'price': '₮4,200',
        'rating': 4,
        'image': 'https://via.placeholder.com/150/FF9FF3/FFFFFF?text=Лооль',
      },
      {
        'name': 'Төмс',
        'price': '₮2,800',
        'rating': 3,
        'image': 'https://via.placeholder.com/150/54A0FF/FFFFFF?text=Төмс',
      },
      {
        'name': 'Сонгино',
        'price': '₮1,900',
        'rating': 4,
        'image': 'https://via.placeholder.com/150/5F27CD/FFFFFF?text=Сонгино',
      },
      {
        'name': 'Сармис',
        'price': '₮3,200',
        'rating': 5,
        'image': 'https://via.placeholder.com/150/00D2D3/FFFFFF?text=Сармис',
      },
      {
        'name': 'Хүрэн манжин',
        'price': '₮4,500',
        'rating': 4,
        'image': 'https://via.placeholder.com/150/FF9F43/FFFFFF?text=Манжин',
      },
      {
        'name': 'Гүзээлзгэнэ',
        'price': '₮6,800',
        'rating': 5,
        'image': 'https://via.placeholder.com/150/EE5253/FFFFFF?text=Гүзээлзгэнэ',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
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
      String imageUrl,
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
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[200],
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
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