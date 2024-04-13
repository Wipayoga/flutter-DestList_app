import 'package:flutter/material.dart';

class AboutDrawer extends StatefulWidget {
  const AboutDrawer({Key? key}) : super(key: key);

  @override
  _AboutDrawer createState() => _AboutDrawer();
}

class _AboutDrawer extends State<AboutDrawer> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context); // Kembali ke halaman sebelumnya saat tombol kembali ditekan
        return true; // Kembalikan true untuk mengizinkan navigasi kembali
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                image: 'assets/image/destlistlogo.jpg',
                description: 'Destination List App',
                fullDescription:
                    'Destination List App adalah aplikasi berbasis mobile yang berisikan tentang list list dari destinasi tempat wisata yang ingin di cari oleh pengguna, dengan adanya aplikasi ini diharapkan pemngguna dapat dengan mudah mencari informasi mengenai destinasi yang ingin dituju.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String image,
    required String description,
    required String fullDescription,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 150,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  fullDescription,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
