import 'package:flutter/material.dart';
import 'home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: const Text("Emart Mongolia"),
        actions: const [Icon(Icons.shopping_cart)],
      ),
      body: const SafeArea(
        child: HomeContent(),
      ),
    );
  }
}