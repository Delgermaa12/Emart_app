// lib/main.dart
import 'package:flutter/material.dart';
import 'forgot_password_page.dart';
import 'home_screen.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'auth_service.dart';
import 'user_screen.dart';

void main() => runApp(const EmartApp());

class EmartApp extends StatelessWidget {
  const EmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emart Mongolia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber[700],
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot': (context) => const ForgotPasswordPage(),
        '/home': (context) => const HomeScreen(),
        '/myprofile': (context) => const MyPage(),
      },
    );
  }
}