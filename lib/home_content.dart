// lib/home_content.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'star_rating.dart';
import 'product_details.dart';
import 'user_model.dart';

class HomeContent extends StatelessWidget {
  final User? user;
  const HomeContent({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFFFFCC00);

    return CustomScrollView(
      slivers: [
        // 🔸 Header Event Bar
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User greeting section
              if (user != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.person, color: Colors.amber),
                      const SizedBox(width: 10),
                      Text(
                        "Сайн байна уу, ${user!.name}!",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              // Submenu
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Container(
                  color: primaryColor,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      ...[
                        "ЭВЕНТ", "STARLINK", "ШУУРХАЙ", "ШИНЭ БАРАА",
                        "ХЯМДРАЛ", "ШИНЭ ЖИЛ", "И-ЖОР"
                      ].map((text) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        child: Text(
                          text,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      )).toList(),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Banner
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
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange.shade700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Categories section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "АНГИЛЛЫН ЖАГСААЛТ",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),

        // Categories Grid
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
          ),
          delegate: SliverChildListDelegate([
            CategoryItem("Жимс,\nхүнсний ногоо", Icons.local_grocery_store),
            CategoryItem("Өдөр тутмын\nшинэ хүнс", Icons.egg_alt),
            CategoryItem("Мах махан\nбүтээгдэхүүн", Icons.set_meal),
            CategoryItem("Боловсруулсан\nхүнс", Icons.fastfood),
            CategoryItem("Ахуйн\nбүтээгдэхүүн", Icons.cleaning_services),
            CategoryItem("Шингэн\nхүнс", Icons.local_drink),
            CategoryItem("Даршилсан\nхүнс", Icons.inventory),
            CategoryItem("Хөлдөөсөн\nбүтээгдэхүүн", Icons.ac_unit),
          ]),
        ),

        // New Products Section
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "ШИНЭ БАРАА",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),

        // New Products Horizontal List
        SliverToBoxAdapter(
          child: SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              children: const [
                ProductCard(
                  imageUrl: "https://lh3.googleusercontent.com/pw/AP1GczPkp7Adf.jpg",
                  title: "Нүүрний суурь тос",
                  brand: "Lhamour | 30мл",
                  price: "68,000₮",
                ),
                ProductCard(
                  imageUrl: "https://lh3.googleusercontent.com/pw/AP1GczPkp7Adf2.jpg",
                  title: "Биеийн скраб кофе",
                  brand: "Lhamour | 300гр",
                  price: "42,000₮",
                ),
                ProductCard(
                  imageUrl: "https://lh3.googleusercontent.com/pw/AP1GczPkp7Adf3.jpg",
                  title: "Зөөлрүүлэгч тос",
                  brand: "Keelt | 200гр",
                  price: "39,900₮",
                ),
              ],
            ),
          ),
        ),

        // Main Product Grid Section
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, gridConstraints) {
                final crossAxisCount = gridConstraints.maxWidth < 600 ? 2 : 4;
                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.85,
                  children: [
                    _buildProduct(context, "Серум", "₮50,000", 4, "assets/images/product1.png"),
                    _buildProduct(context, "Тоглоом", "₮22,000", 5, "assets/images/product2.png"),
                    _buildProduct(context, "Баннын бөмбөлөг", "₮5,000", 3, "assets/images/product3.png"),
                    _buildProduct(context, "Чихмэл нохой", "₮50,000", 4, "assets/images/product4.png"),
                    _buildProduct(context, "Бамарууш чихмэл", "₮45,000", 5, "assets/images/product5.png"),
                    _buildProduct(context, "Ном", "₮25,000", 2, "assets/images/product6.png"),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Product card widget
  Widget _buildProduct(
      BuildContext context,
      String name,
      String price,
      int rating,
      String imagePath,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              name: name,
              price: price,
              rating: rating,
              imagePath: imagePath,
            ),
          ),
        );
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
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.shopping_bag,
                          color: Colors.grey[400], size: 40),
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
                          fontSize: 15, fontWeight: FontWeight.bold, height: 1.2),
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
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryItem(this.label, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 36, color: Colors.amber[800]),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String brand;
  final String price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.brand,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add navigation to product details if needed
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 120,
                  color: Colors.grey[200],
                  child: Icon(Icons.shopping_bag, color: Colors.grey[400], size: 40),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(brand, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 8),
                  Text(price, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}