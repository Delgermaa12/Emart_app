import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarlinkPage extends StatelessWidget {
  const StarlinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "STARLINK",
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
          "Starlink бүтээгдэхүүнүүд",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}