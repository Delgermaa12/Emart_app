import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Forgot Russian language", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("LOGIN"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 10),
            Text("OR"),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              child: Text("LOGIN WITH GOOGLE"),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text("Register"),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text("Continue as Guest"),
            ),
          ],
        ),
      ),
    );
  }
}