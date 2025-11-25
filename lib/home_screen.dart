// lib/home_screen.dart
import 'package:flutter/material.dart';
import 'home_content.dart';
import 'user_model.dart';

class HomeScreen extends StatefulWidget {  // Changed to StatefulWidget
  final User? user;
  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;  // Added currentIndex state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: HomeContent(user: widget.user),  // Use widget.user
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFCC00),
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
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.search, color: Colors.grey, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Бараа хайх...",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (widget.user != null)  // Use widget.user
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.user!.name.split(' ').first,  // Use widget.user
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  const Icon(Icons.notifications_none, color: Colors.grey, size: 20),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,  // Use the state variable
      selectedItemColor: const Color(0xFFFFCC00),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        _onBottomNavItemTapped(index, context);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Нүүр',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner_outlined),
          label: 'Scan&Go',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xFFFFCC00),
            child: Icon(Icons.qr_code, color: Colors.white),
          ),
          label: 'Ипойнт',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Сагс',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Миний',
        ),
      ],
    );
  }

  void _onBottomNavItemTapped(int index, BuildContext context) {
    if (index == 4) {
      // Navigate to MyPage using named route
      Navigator.pushNamed(
        context,
        '/mypage',  // Changed from '/myprofile' to '/mypage' to match main.dart
        arguments: widget.user,  // Use widget.user
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}