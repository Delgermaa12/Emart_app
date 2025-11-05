import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectCardPage extends StatefulWidget {
  const ConnectCardPage({super.key});

  @override
  State<ConnectCardPage> createState() => _ConnectCardPageState();
}

class _ConnectCardPageState extends State<ConnectCardPage> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardPinController = TextEditingController();

  bool showCardError = false; // Доор алдаа текст харагдах эсэх

  @override
  Widget build(BuildContext context) {
    const primaryYellow = Color(0xFFFFD200);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ипойнт карт бүртгэх",
          style: GoogleFonts.roboto(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: primaryYellow,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emart карт зураг
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'images/emart_harcard.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Мэдээлэл шинэчлэх товч
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Мэдээлэл амжилттай шинэчлэгдлээ"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryYellow,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "МЭДЭЭЛЭЛ ШИНЭЧЛЭХ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Картын дугаар
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Картын дугаар",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  showCardError = false; // Карт оруулсан бол алдаа арилна
                });
              },
            ),

            // Доор алдаа текст


            const SizedBox(height: 15),
            TextField(
              controller: cardPinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Картын нууц үг",
                border: OutlineInputBorder(),
              ),
            ),
            if (showCardError)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Align(
                  alignment: Alignment.centerRight, // Баруун талд байрлуулах
                  child: Text(
                    "Картын дугаар мартсан",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 25),

            // Хадгалах товч
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (cardNumberController.text.isEmpty) {
                      showCardError = true; // Хоосон бол алдаа текст харагдах
                    } else {
                      showCardError = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Карт амжилттай хадгалагдлаа",
                            style: TextStyle(color: Colors.white), // Зөв бичлэг
                          ),
                          backgroundColor: Colors.green, // Ногоон өнгө
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }

                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryYellow,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "ХАДГАЛАХ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
