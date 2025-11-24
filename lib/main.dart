import 'package:emart_app/baraatai_sags.dart';
import 'package:emart_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'ipoint_page.dart';
import 'user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final Color primaryColor = const Color(0xFFFFCC00);

  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text('Scan & Go', style: TextStyle(fontSize: 24))),
    const IpointPage(),
    const CartPage(),
    const MyPage(),
  ];

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      title: Row(
        children: [
          const Text(
            'emart',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 5),
                  Text("Бараа хайх...", style: TextStyle(color: Colors.grey)),
                  Spacer(),
                  Icon(Icons.notifications_none, color: Colors.grey),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
            return;
          }

          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Нүүр',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined),
            label: 'Scan&Go',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFFDD835),
              child: Icon(Icons.qr_code, color: Colors.white),
            ),
            label: 'Ипойнт',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Сагс',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Миний',
          ),
        ],
      ),
    );
  }
}
