import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFFFFCC00);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔸 Header Event Bar
            Container(
              color: primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("ЭВЕНТ",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text("STARLINK",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(" ШУУРХАЙ",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text( "BEAUTY",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "АНГИЛЛЫН ЖАГСААЛТ",
                style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CategoryItem("Жимс,\nхүнсний ногоо", Icons.local_grocery_store),
                CategoryItem("Өдөр тутмын\nшинэ хүнс", Icons.egg_alt),
                CategoryItem("Мах махан\nбүтээгдэхүүн", Icons.set_meal),
                CategoryItem("Боловсруулсан\nхүнс", Icons.fastfood),
                CategoryItem("Ахуйн\nбүтээгдэхүүн", Icons.cleaning_services),
                CategoryItem("Шингэн\nхүнс", Icons.local_drink),
                CategoryItem("Даршилсан\nхүнс", Icons.inventory),
                CategoryItem("Хөлдөөсөн\nбүтээгдэхүүн", Icons.ac_unit),
              ],
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "ШИНЭ БАРАА",
                style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                children: const [
                  ProductCard(
                    imageUrl:
                    "https://lh3.googleusercontent.com/pw/AP1GczPkp7Adf.jpg",
                    title: "Нүүрний суурь тос",
                    brand: "Lhamour | 30мл",
                    price: "68,000₮",
                  ),
                  ProductCard(
                    imageUrl:
                    "https://lh3.googleusercontent.com/pw/AP1GczPkp7Adf2.jpg",
                    title: "Биеийн скраб кофе",
                    brand: "Lhamour | 300гр",
                    price: "42,000₮",
                  ),
                  ProductCard(
                    imageUrl:
                    "https://lh3.googleusercontent.com/pw/AP1GczPkp7Adf3.jpg",
                    title: "Зөөлрүүлэгч тос",
                    brand: "Keelt | 200гр",
                    price: "39,900₮",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
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
    return Container(
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
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(brand,
                    style:
                    const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 8),
                Text(price,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
