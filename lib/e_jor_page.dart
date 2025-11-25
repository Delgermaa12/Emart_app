import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EJorPage extends StatelessWidget {
  const EJorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "И-ЖОР",
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
          "И-ЖОР үйлчилгээний хуудас",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}