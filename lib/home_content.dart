// lib/home_content.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'star_rating.dart';
import 'product_details.dart';
import 'user_model.dart';
import 'category_products_page.dart';
import 'event_page.dart' as event_page; // Renamed import to avoid conflict
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
                        // ЭВЕНТ - Using renamed import
                        _buildMenuButton(
                          context,
                          "ЭВЕНТ",
                          const event_page.EventPage(), // Fixed: using renamed import
                        ),
                        // STARLINK
                        _buildMenuButton(
                          context,
                          "STARLINK",
                          const StarlinkPage(),
                        ),
                        // ШУУРХАЙ
                        _buildMenuButton(
                          context,
                          "ШУУРХАЙ",
                          const FlashSalePage(),
                        ),
                        // ШИНЭ БАРАА
                        _buildMenuButton(
                          context,
                          "ШИНЭ БАРАА",
                          CategoryProductsPage( // Fixed: now properly recognized
                            categoryName: "ШИНЭ БАРАА",
                            categoryIcon: Icons.new_releases,
                          ),
                        ),
                        // ХЯМДРАЛ
                        _buildMenuButton(
                          context,
                          "ХЯМДРАЛ",
                          CategoryProductsPage( // Fixed: now properly recognized
                            categoryName: "ХЯМДРАЛТАЙ БҮТЭЭГДЭХҮҮН",
                            categoryIcon: Icons.local_offer,
                          ),
                        ),
                        // ШИНЭ ЖИЛ
                        _buildMenuButton(
                          context,
                          "ШИНЭ ЖИЛ",
                          const NewYearPage(),
                        ),
                        // И-ЖОР
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
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                children: const [
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/FFCC00/FFFFFF?text=Тос",
                    title: "Нүүрний суурь тос",
                    brand: "Lhamour | 30мл",
                    price: "68,000₮",
                  ),
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/FF6B6B/FFFFFF?text=Скраб",
                    title: "Биеийн скраб кофе",
                    brand: "Lhamour | 300гр",
                    price: "42,000₮",
                  ),
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/4ECDC4/FFFFFF?text=Тос",
                    title: "Зөөлрүүлэгч тос",
                    brand: "Keelt | 200гр",
                    price: "39,900₮",
                  ),
                ],
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
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                children: const [
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/FFCC00/FFFFFF?text=Тос",
                    title: "Нүүрний суурь тос",
                    brand: "Lhamour | 30мл",
                    price: "68,000₮",
                  ),
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/FF6B6B/FFFFFF?text=Скраб",
                    title: "Биеийн скраб кофе",
                    brand: "Lhamour | 300гр",
                    price: "42,000₮",
                  ),
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/4ECDC4/FFFFFF?text=Тос",
                    title: "Зөөлрүүлэгч тос",
                    brand: "Keelt | 200гр",
                    price: "39,900₮",
                  ),
                ],
              ),
            ),
          ),

          // Free Product Section
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
                        "НЭГИЙГ ҮНЭГҮЙ АВААРАЙ",
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
                                categoryName: "НЭГИЙГ ҮНЭГҮЙ АВААРАЙ",
                                categoryIcon: Icons.card_giftcard,
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

          // Free Product Horizontal List
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                children: const [
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/FFCC00/FFFFFF?text=Тос",
                    title: "Нүүрний суурь тос",
                    brand: "Lhamour | 30мл",
                    price: "68,000₮",
                  ),
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/FF6B6B/FFFFFF?text=Скраб",
                    title: "Биеийн скраб кофе",
                    brand: "Lhamour | 300гр",
                    price: "42,000₮",
                  ),
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/4ECDC4/FFFFFF?text=Тос",
                    title: "Зөөлрүүлэгч тос",
                    brand: "Keelt | 200гр",
                    price: "39,900₮",
                  ),
                ],
              ),
            ),
          ),

          // Bundle Discount Section
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
                        "ХАМТАД НЬ АВБАЛ ИЛҮҮ ХЯМД",
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
                                categoryName: "ХАМТАД НЬ АВБАЛ ИЛҮҮ ХЯМД",
                                categoryIcon: Icons.shopping_basket,
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

          // Bundle Discount Horizontal List
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                children: const [
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/FFCC00/FFFFFF?text=Тос",
                    title: "Нүүрний суурь тос",
                    brand: "Lhamour | 30мл",
                    price: "68,000₮",
                  ),
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/FF6B6B/FFFFFF?text=Скраб",
                    title: "Биеийн скраб кофе",
                    brand: "Lhamour | 300гр",
                    price: "42,000₮",
                  ),
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/4ECDC4/FFFFFF?text=Тос",
                    title: "Зөөлрүүлэгч тос",
                    brand: "Keelt | 200гр",
                    price: "39,900₮",
                  ),
                ],
              ),
            ),
          ),

          // Recently Viewed Section
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
                        "ТАНЫ СҮҮЛД ҮЗСЭН БАРАА",
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
                                categoryName: "ТАНЫ СҮҮЛД ҮЗСЭН БАРАА",
                                categoryIcon: Icons.history,
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

          // Recently Viewed Horizontal List
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                children: const [
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/FFCC00/FFFFFF?text=Тос",
                    title: "Нүүрний суурь тос",
                    brand: "Lhamour | 30мл",
                    price: "68,000₮",
                  ),
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/FF6B6B/FFFFFF?text=Скраб",
                    title: "Биеийн скраб кофе",
                    brand: "Lhamour | 300гр",
                    price: "42,000₮",
                  ),
                  ProductCard(
                    imageUrl: "https://via.placeholder.com/150/4ECDC4/FFFFFF?text=Тос",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with arrow
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
                      final crossAxisCount = gridConstraints.maxWidth < 600 ? 2 : 4;
                      return GridView.count(
                        crossAxisCount: crossAxisCount,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.85,
                        children: [
                          _buildProduct(context, "Серум", "₮50,000", 4, "https://via.placeholder.com/150/45B7D1/FFFFFF?text=Серум"),
                          _buildProduct(context, "Тоглоом", "₮22,000", 5, "https://via.placeholder.com/150/96CEB4/FFFFFF?text=Тоглоом"),
                          _buildProduct(context, "Баннын бөмбөлөг", "₮5,000", 3, "https://via.placeholder.com/150/FECA57/FFFFFF?text=Бөмбөлөг"),
                          _buildProduct(context, "Чихмэл нохой", "₮50,000", 4, "https://via.placeholder.com/150/FF9FF3/FFFFFF?text=Нохой"),
                          _buildProduct(context, "Бамарууш чихмэл", "₮45,000", 5, "https://via.placeholder.com/150/54A0FF/FFFFFF?text=Бамарууш"),
                          _buildProduct(context, "Ном", "₮25,000", 2, "https://via.placeholder.com/150/5F27CD/FFFFFF?text=Ном"),
                        ],
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

  // Build categories drawer
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
          // Header
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
          // Categories List
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
          // Footer
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
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 120,
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
                  height: 120,
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
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    brand,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
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