import 'package:destlist_app/pages/intro_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/destlistlogo.jpg',
              width: 150,
            ),
            const SizedBox(height: 20),
            Text(
              'Selamat Datang di Aplikasi Destination List',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => IntroPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Atur jarak antara konten dan tepi tombol
              ),
              child: const Text('Masuk', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
