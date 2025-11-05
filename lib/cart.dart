import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Сагс',
          style: GoogleFonts.notoSans(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 60), // 🟡 дэлгэцийн дээд талаас зай
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // 🟡 Дээрээс байрлуулах
              children: [
                Center( // 🟢 зураг төвд байрлана
                  child: Image.asset(
                    'assets/empty_cart.jpeg', // таны зураг
                    width: 130,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Таны сагс хоосон байна',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
