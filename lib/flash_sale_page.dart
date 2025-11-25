import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: const Center(
        child: Text(
          "Шуурхай худалдааны хуудас",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}