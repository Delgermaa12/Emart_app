import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAddressPage extends StatelessWidget {
  const NewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Хүргэлтийн хаяг бүртгэх',
          style: GoogleFonts.notoSans(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField('Хаягийн нэр'),
            buildTextField('Утас'),
            buildTextField('Хот/аймаг'),
            buildTextField('Сум/дүүрэг'),
            buildTextField('Баг/хороо'),
            buildTextField('Хотхон (заавал биш)'),
            Row(
              children: [
                Expanded(child: buildTextField('Байр (заавал биш)')),
                const SizedBox(width: 8),
                Expanded(child: buildTextField('Тоот (заавал биш)')),
              ],
            ),
            buildTextField('Дэлгэрэнгүй хаяг'),
            buildTextField('What3words (Жишээ: aaruul.salaa.buuz)'),
            const SizedBox(height: 140),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'БҮРТГЭХ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
