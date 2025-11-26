import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'star_rating.dart';
import 'product_details.dart';
import 'user_model.dart';
import 'category_products_page.dart';
import 'event_page.dart' as event_page;
import 'starlink_page.dart';
import 'flash_sale_page.dart';
import 'new_year_page.dart';
import 'e_jor_page.dart';

class HomeContent extends StatefulWidget {
  final User? user;
  const HomeContent({super.key, this.user});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Sample product data
  final List<Map<String, dynamic>> newProducts = [
    {
      'name': 'Нүүрний суурь тос',
      'price': '68,000₮',
      'rating': 4,
      'imagePath': 'https://via.placeholder.com/150/FFCC00/FFFFFF?text=Тос',
      'brand': 'Lhamour | 30мл',
    },
    {
      'name': 'Биеийн скраб кофе',
      'price': '42,000₮',
      'rating': 5,
      'imagePath': 'https://via.placeholder.com/150/FF6B6B/FFFFFF?text=Скраб',
      'brand': 'Lhamour | 300гр',
    },
    {
      'name': 'Зөөлрүүлэгч тос',
      'price': '39,900₮',
      'rating': 4,
      'imagePath': 'https://via.placeholder.com/150/4ECDC4/FFFFFF?text=Тос',
      'brand': 'Keelt | 200гр',
    },
  ];

  final List<Map<String, dynamic>> discountedProducts = [
    {
      'name': 'Чихэвч',
      'price': '75,000₮',
      'originalPrice': '120,000₮',
      'rating': 4,
      'imagePath': 'https://via.placeholder.com/150/9966CC/FFFFFF?text=Чихэвч',
      'brand': 'Sony | Wireless',
    },
    {
      'name': 'Ухаалаг гар утас',
      'price': '1,150,000₮',
      'originalPrice': '1,500,000₮',
      'rating': 5,
      'imagePath': 'https://via.placeholder.com/150/6699CC/FFFFFF?text=Утас',
      'brand': 'Samsung | 128GB',
    },
    {
      'name': 'Камер',
      'price': '680,000₮',
      'originalPrice': '890,000₮',
      'rating': 5,
      'imagePath': 'https://via.placeholder.com/150/66CC99/FFFFFF?text=Камер',
      'brand': 'Canon | EOS',
    },
  ];

  final List<Map<String, dynamic>> mainProducts = [
    {
      'name': 'Серум',
      'price': '50,000₮',
      'rating': 4,
      'imagePath': 'https://via.placeholder.com/150/45B7D1/FFFFFF?text=Серум',
    },
    {
      'name': 'Тоглоом',
      'price': '22,000₮',
      'rating': 5,
      'imagePath': 'https://via.placeholder.com/150/96CEB4/FFFFFF?text=Тоглоом',
    },
    {
      'name': 'Баннын бөмбөлөг',
      'price': '5,000₮',
      'rating': 3,
      'imagePath': 'https://via.placeholder.com/150/FECA57/FFFFFF?text=Бөмбөлөг',
    },
    {
      'name': 'Чихмэл нохой',
      'price': '50,000₮',
      'rating': 4,
      'imagePath': 'https://via.placeholder.com/150/FF9FF3/FFFFFF?text=Нохой',
    },
    {
      'name': 'Бамарууш чихмэл',
      'price': '45,000₮',
      'rating': 5,
      'imagePath': 'https://via.placeholder.com/150/54A0FF/FFFFFF?text=Бамарууш',
    },
    {
      'name': 'Ном',
      'price': '25,000₮',
      'rating': 2,
      'imagePath': 'https://via.placeholder.com/150/5F27CD/FFFFFF?text=Ном',
    },
  ];

  // Helper method for menu buttons
  Widget _buildMenuButton(BuildContext context, String text, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFFFFCC00);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: _buildCategoriesDrawer(context),
      body: CustomScrollView(
        slivers: [
          // 🔸 Header Event Bar
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User greeting section
                if (widget.user != null)
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.person, color: Colors.amber),
                        const SizedBox(width: 10),
                        Text(
                          "Сайн байна уу, ${widget.user!.name}!",
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
                        _buildMenuButton(
                          context,
                          "ЭВЕНТ",
                          const event_page.EventPage(),
                        ),
                        _buildMenuButton(
                          context,
                          "STARLINK",
                          const StarlinkPage(),
                        ),
                        _buildMenuButton(
                          context,
                          "ШУУРХАЙ",
                          const FlashSalePage(),
                        ),
                        _buildMenuButton(
                          context,
                          "ШИНЭ БАРАА",
                          CategoryProductsPage(
                            categoryName: "ШИНЭ БАРАА",
                            categoryIcon: Icons.new_releases,
                          ),
                        ),
                        _buildMenuButton(
                          context,
                          "ХЯМДРАЛ",
                          CategoryProductsPage(
                            categoryName: "ХЯМДРАЛТАЙ БҮТЭЭГДЭХҮҮН",
                            categoryIcon: Icons.local_offer,
                          ),
                        ),
                        _buildMenuButton(
                          context,
                          "ШИНЭ ЖИЛ",
                          const NewYearPage(),
                        ),
                        _buildMenuButton(
                          context,
                          "И-ЖОР",
                          const EJorPage(),
                        ),
                        const SizedBox(width: 16),
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

                // Categories section with arrow
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "АНГИЛЛЫН ЖАГСААЛТ",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 24),
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
                    ],
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
              childAspectRatio: 0.9,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ШИНЭ БАРАА",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryProductsPage(
                                categoryName: "ШИНЭ БАРАА",
                                categoryIcon: Icons.new_releases,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios, size: 18),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // New Products Horizontal List
          SliverToBoxAdapter(
            child: SizedBox(
              height: 280, // Increased height to accommodate wider cards
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                itemCount: newProducts.length,
                itemBuilder: (context, index) {
                  final product = newProducts[index];
                  return ProductCard(
                    imageUrl: product['imagePath'],
                    title: product['name'],
                    brand: product['brand'],
                    price: product['price'],
                    rating: product['rating'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            name: product['name'],
                            price: product['price'],
                            rating: product['rating'],
                            imagePath: product['imagePath'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          // Discounted Products Section
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ХЯМДРАЛТАЙ БҮТЭЭГДЭХҮҮН",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryProductsPage(
                                categoryName: "ХЯМДРАЛТАЙ БҮТЭЭГДЭХҮҮН",
                                categoryIcon: Icons.local_offer,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios, size: 18),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // Discounted Products Horizontal List
          SliverToBoxAdapter(
            child: SizedBox(
              height: 280, // Increased height to accommodate wider cards
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                itemCount: discountedProducts.length,
                itemBuilder: (context, index) {
                  final product = discountedProducts[index];
                  return ProductCard(
                    imageUrl: product['imagePath'],
                    title: product['name'],
                    brand: product['brand'],
                    price: product['price'],
                    rating: product['rating'],
                    originalPrice: product['originalPrice'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            name: product['name'],
                            price: product['price'],
                            rating: product['rating'],
                            imagePath: product['imagePath'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          // Main Product Grid Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ЗӨВХӨН ТАНД",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryProductsPage(
                                  categoryName: "ЗӨВХӨН ТАНД",
                                  categoryIcon: Icons.person,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios, size: 18),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),

                  // Grid
                  LayoutBuilder(
                    builder: (context, gridConstraints) {
                      final crossAxisCount = gridConstraints.maxWidth < 600 ? 2 : 3; // Reduced from 4 to 3 for wider cards
                      return GridView.count(
                        crossAxisCount: crossAxisCount,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 16, // Increased spacing
                        crossAxisSpacing: 16, // Increased spacing
                        childAspectRatio: 0.75, // Adjusted for wider cards
                        children: mainProducts.map((product) {
                          return _buildProduct(
                            context,
                            product['name'],
                            product['price'],
                            product['rating'],
                            product['imagePath'],
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build categories drawer (keep the existing implementation)
  Widget _buildCategoriesDrawer(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"name": "Жимс, хүнсний ногоо", "icon": Icons.local_grocery_store},
      {"name": "Өдөр тутмын шинэ хүнс", "icon": Icons.egg_alt},
      {"name": "Мах махан бүтээгдэхүүн", "icon": Icons.set_meal},
      {"name": "Боловсруулсан хүнс", "icon": Icons.fastfood},
      {"name": "Ахуйн бүтээгдэхүүн", "icon": Icons.cleaning_services},
      {"name": "Шингэн хүнс", "icon": Icons.local_drink},
      {"name": "Даршилсан хүнс", "icon": Icons.inventory},
      {"name": "Хөлдөөсөн бүтээгдэхүүн", "icon": Icons.ac_unit},
      {"name": "Хувцас хунар", "icon": Icons.checkroom},
      {"name": "Гоо сайхан", "icon": Icons.face_retouching_natural},
      {"name": "Эрүүл мэнд", "icon": Icons.medical_services},
      {"name": "Тоглоом, хобби", "icon": Icons.toys},
      {"name": "Гэр ахуй", "icon": Icons.home},
      {"name": "Цахилгаан бараа", "icon": Icons.electrical_services},
      {"name": "Ном, сурах бичиг", "icon": Icons.menu_book},
    ];

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Бүх ангилал",
                  style: GoogleFonts.notoSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 24),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFCC00).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        category["icon"] as IconData,
                        color: const Color(0xFFFFCC00),
                        size: 20,
                      ),
                    ),
                    title: Text(
                      category["name"] as String,
                      style: GoogleFonts.notoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryProductsPage(
                            categoryName: category["name"] as String,
                            categoryIcon: category["icon"] as IconData,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border(
                top: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Emart Mongolia",
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "v1.0.0",
                  style: GoogleFonts.notoSans(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Product card widget - Updated with wider layout
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
          width: double.infinity, // Take full available width
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imagePath,
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
                          SizedBox(height: 8),
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
              const SizedBox(height: 12),

              // Product details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.amber[700],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProductsPage(
              categoryName: label.replaceAll('\n', ' '),
              categoryIcon: icon,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.amber[50],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30, color: Colors.amber[800]),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String brand;
  final String price;
  final int rating;
  final String? originalPrice;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.brand,
    required this.price,
    required this.rating,
    this.originalPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180, // Increased from 160 to 180 for wider cards
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                height: 140, // Slightly increased height
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 140,
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
                  height: 140,
                  color: Colors.grey[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag, color: Colors.grey[400], size: 40),
                      SizedBox(height: 4),
                      Text(
                        title,
                        style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Content section with more padding
            Padding(
              padding: const EdgeInsets.all(12), // Increased padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    brand,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 6),
                  StarRating(count: rating),
                  const SizedBox(height: 8),

                  // Price section with better layout
                  if (originalPrice != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          originalPrice!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}