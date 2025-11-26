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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First Image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/starlink.jpeg",
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.satellite_alt, color: Colors.grey[400], size: 50),
                        const SizedBox(height: 8),
                        Text(
                          "Starlink image 1",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Second Image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/starlink1.jpeg",
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wifi, color: Colors.grey[400], size: 50),
                        const SizedBox(height: 8),
                        Text(
                          "Starlink image 2",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Third Image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/starlink2.jpeg",
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.router, color: Colors.grey[400], size: 50),
                        const SizedBox(height: 8),
                        Text(
                          "Starlink image 3",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Fourth Image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/starlink3.jpeg",
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.satellite, color: Colors.grey[400], size: 50),
                        const SizedBox(height: 8),
                        Text(
                          "Starlink image 4",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}