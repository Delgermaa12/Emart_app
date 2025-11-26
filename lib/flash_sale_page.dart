import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'star_rating.dart';
import 'product_details.dart';

class FlashSalePage extends StatelessWidget {
  const FlashSalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ШУУРХАЙ",
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
            // First Flash Sale Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/shuurhai1.jpeg",
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.red[100],
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flash_on, color: Colors.red, size: 50),
                        const SizedBox(height: 8),
                        Text(
                          "Шуурхай худалдаа 1",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // First Flash Sale Products
            _buildFlashSaleProducts1(context),

            const SizedBox(height: 24),

            // Second Flash Sale Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/shuurhai2.jpeg",
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.orange[100],
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_offer, color: Colors.orange, size: 50),
                        const SizedBox(height: 8),
                        Text(
                          "Шуурхай худалдаа 2",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Second Flash Sale Products
            _buildFlashSaleProducts2(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFlashSaleProducts1(BuildContext context) {
    final List<Map<String, dynamic>> flashSale1Products = [
      {
        'name': 'Гар утас',
        'price': '₮1,200,000',
        'originalPrice': '₮1,500,000',
        'rating': 5,
        'image': 'assets/images/products/phone.jpg',
        'discount': '20%',
      },
      {
        'name': 'Зурагт',
        'price': '₮850,000',
        'originalPrice': '₮1,200,000',
        'rating': 4,
        'image': 'assets/images/products/tv.jpg',
        'discount': '30%',
      },
      {
        'name': 'Лаптоп',
        'price': '₮2,500,000',
        'originalPrice': '₮3,200,000',
        'rating': 5,
        'image': 'assets/images/products/laptop.jpg',
        'discount': '22%',
      },
      {
        'name': 'Камер',
        'price': '₮650,000',
        'originalPrice': '₮850,000',
        'rating': 4,
        'image': 'assets/images/products/camera.jpg',
        'discount': '24%',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: flashSale1Products.length,
        itemBuilder: (context, index) {
          final product = flashSale1Products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    name: product['name'] as String,
                    price: product['price'] as String,
                    rating: product['rating'] as int,
                    imagePath: product['image'] as String,
                  ),
                ),
              );
            },
            child: _buildFlashSaleProductCard(
              context,
              product['name'] as String,
              product['price'] as String,
              product['originalPrice'] as String,
              product['rating'] as int,
              product['image'] as String,
              product['discount'] as String,
            ),
          );
        },
      ),
    );
  }

  Widget _buildFlashSaleProducts2(BuildContext context) {
    final List<Map<String, dynamic>> flashSale2Products = [
      {
        'name': 'Үс хатаагч',
        'price': '₮45,000',
        'originalPrice': '₮65,000',
        'rating': 4,
        'image': 'assets/images/products/hairdryer.jpg',
        'discount': '31%',
      },
      {
        'name': 'Аяга таваг угаагч',
        'price': '₮320,000',
        'originalPrice': '₮450,000',
        'rating': 5,
        'image': 'assets/images/products/dishwasher.jpg',
        'discount': '29%',
      },
      {
        'name': 'Ширэг',
        'price': '₮120,000',
        'originalPrice': '₮180,000',
        'rating': 4,
        'image': 'assets/images/products/table.jpg',
        'discount': '33%',
      },
      {
        'name': 'Чихэвч',
        'price': '₮85,000',
        'originalPrice': '₮120,000',
        'rating': 5,
        'image': 'assets/images/products/headphones.jpg',
        'discount': '29%',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: flashSale2Products.length,
        itemBuilder: (context, index) {
          final product = flashSale2Products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    name: product['name'] as String,
                    price: product['price'] as String,
                    rating: product['rating'] as int,
                    imagePath: product['image'] as String,
                  ),
                ),
              );
            },
            child: _buildFlashSaleProductCard(
              context,
              product['name'] as String,
              product['price'] as String,
              product['originalPrice'] as String,
              product['rating'] as int,
              product['image'] as String,
              product['discount'] as String,
            ),
          );
        },
      ),
    );
  }

  Widget _buildFlashSaleProductCard(
      BuildContext context,
      String name,
      String price,
      String originalPrice,
      int rating,
      String imagePath,
      String discount,
      ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Discount Badge
            Align(
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

            // Product Image
            Expanded(
              flex: 3,
              child: Center(
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
            ),

            const SizedBox(height: 8),

            // Product Details
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // Price with discount
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        originalPrice,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
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
    );
  }
}