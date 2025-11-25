import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String email;
  final String option;

  const SuccessPage({
    super.key,
    required this.email,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    final yellow = const Color(0xFFFFCC00);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: yellow,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Амжилттай", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 40),

            Icon(Icons.check_circle, color: yellow, size: 110),

            const SizedBox(height: 30),

            const Text(
              "Сэргээх хүсэлт илгээгдлээ!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text(
              "Таны и-мэйл:\n$email",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 15),

            Text(
              "Таны сонголт:\n$option",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: yellow,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                "Буцах",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
