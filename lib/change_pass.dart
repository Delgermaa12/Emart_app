import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final currentController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  bool showCurrent = false;
  bool showNew = false;
  bool showConfirm = false;

  void showConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.amber),
              SizedBox(width: 8),
              Flexible(child: Text("Та нууц үгээ өөрчлөхдөө итгэлтэй байна уу?")),
            ],
          ),
          content: const Text(
            "Таны бүртгэлтэй утасны дугаарт шинэ нууц үгийг илгээнэ.",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Үгүй", style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFCC00)),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Нууц үг амжилттай солигдлоо")),
                );
              },
              child: const Text("Тийм", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFCC00),
        title: const Text("Тохиргоо"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text("Нууц үг солих", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),

            // Одоогийн нууц үг
            TextField(
              controller: currentController,
              obscureText: !showCurrent,
              decoration: InputDecoration(
                labelText: "Одоогийн нууц үг",
                suffixIcon: IconButton(
                  icon: Icon(showCurrent ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => showCurrent = !showCurrent),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Шинэ нууц үг
            TextField(
              controller: newController,
              obscureText: !showNew,
              decoration: InputDecoration(
                labelText: "Шинэ нууц үг",
                suffixIcon: IconButton(
                  icon: Icon(showNew ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => showNew = !showNew),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Шинэ нууц үг дахин давтах
            TextField(
              controller: confirmController,
              obscureText: !showConfirm,
              decoration: InputDecoration(
                labelText: "Шинэ нууц үг дахин давтах",
                suffixIcon: IconButton(
                  icon: Icon(showConfirm ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => showConfirm = !showConfirm),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            // СОЛИХ товч
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFCC00),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: showConfirmDialog,
                child: const Text("СОЛИХ", style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
