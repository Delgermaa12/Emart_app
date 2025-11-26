import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'star_rating.dart';

class NewYearPage extends StatelessWidget {
  const NewYearPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ШИНЭ ЖИЛ",
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
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              width: double.infinity,
              height: 200,
              child: Container(
                color: Colors.blue[50],
                child: const Icon(
                  Icons.celebration,
                  size: 80,
                  color: Colors.blue,
                ),
              ),
            ),

            // New Year Gifts Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Шинэ жилийн бэлэгүүд",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Бүгдийг харах",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Horizontal Scroll Products
            _buildHorizontalProducts(),

            const SizedBox(height: 24),

            // New Year Discounts Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Шинэ жилийн хямдралууд",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Бүгдийг харах",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Horizontal Scroll Discount Products
            _buildHorizontalDiscountProducts(),

            const SizedBox(height: 16), // Added extra space at bottom
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalProducts() {
    final List<Map<String, dynamic>> newYearProducts = [
      {
        'name': 'Шинэ жилийн сүүл',
        'price': '₮15,000',
        'rating': 5,
        'isGift': true,
      },
      {
        'name': 'Гэрэлт мод',
        'price': '₮45,000',
        'rating': 4,
        'isGift': true,
      },
      {
        'name': 'Бэлэгний хайрцаг',
        'price': '₮8,000',
        'rating': 4,
        'isGift': true,
      },
      {
        'name': 'Шинэ жилийн хувцас',
        'price': '₮25,000',
        'rating': 5,
        'isGift': true,
      },
      {
        'name': 'Тогширч',
        'price': '₮12,000',
        'rating': 4,
        'isGift': true,
      },
      {
        'name': 'Шар айраг',
        'price': '₮6,500',
        'rating': 5,
        'isGift': false,
      },
    ];

    return SizedBox(
      height: 240, // Increased height to prevent overflow
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: newYearProducts.length,
        itemBuilder: (context, index) {
          final product = newYearProducts[index];
          return _buildHorizontalProductCard(
            product['name'] as String,
            product['price'] as String,
            product['rating'] as int,
            product['isGift'] as bool,
          );
        },
      ),
    );
  }

  Widget _buildHorizontalDiscountProducts() {
    final List<Map<String, dynamic>> discountProducts = [
      {
        'name': 'Ухаалаг гар утас',
        'price': '₮1,150,000',
        'originalPrice': '₮1,500,000',
        'rating': 5,
        'discount': '23%',
      },
      {
        'name': 'Зурагт',
        'price': '₮950,000',
        'originalPrice': '₮1,300,000',
        'rating': 4,
        'discount': '27%',
      },
      {
        'name': 'Камер',
        'price': '₮680,000',
        'originalPrice': '₮890,000',
        'rating': 5,
        'discount': '24%',
      },
      {
        'name': 'Чихэвч',
        'price': '₮75,000',
        'originalPrice': '₮120,000',
        'rating': 4,
        'discount': '38%',
      },
      {
        'name': 'Тоглоом',
        'price': '₮45,000',
        'originalPrice': '₮65,000',
        'rating': 5,
        'discount': '31%',
      },
    ];

    return SizedBox(
      height: 240, // Increased height to prevent overflow
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: discountProducts.length,
        itemBuilder: (context, index) {
          final product = discountProducts[index];
          return _buildHorizontalDiscountCard(
            product['name'] as String,
            product['price'] as String,
            product['originalPrice'] as String,
            product['rating'] as int,
            product['discount'] as String,
          );
        },
      ),
    );
  }

  Widget _buildHorizontalProductCard(
      String name,
      String price,
      int rating,
      bool isGift,
      ) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gift Badge
              if (isGift)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'БЭЛЭГ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              // Product Image with constrained height - Using Placeholder
              Container(
                height: 90, // Reduced height to fit better
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.card_giftcard,
                  size: 40,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 8),

              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.green[700],
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

  Widget _buildHorizontalDiscountCard(
      String name,
      String price,
      String originalPrice,
      int rating,
      String discount,
      ) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Discount Badge
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Product Image with constrained height - Using Placeholder
              Container(
                height: 90, // Reduced height to fit better
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 40,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 8),

              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Price with discount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          originalPrice,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
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