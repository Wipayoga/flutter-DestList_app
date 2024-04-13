import 'package:flutter/material.dart';

class DetailPenimbangan extends StatefulWidget {
  const DetailPenimbangan({Key? key}) : super(key: key);

  @override
  _DetailPenimbangan createState() => _DetailPenimbangan();
}

class _DetailPenimbangan extends State<DetailPenimbangan> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context); // Kembali ke halaman sebelumnya saat tombol kembali ditekan
        return true; // Kembalikan true untuk mengizinkan navigasi kembali
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Destinasi'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                image: 'assets/image/penimbangan.jpg',
                description: 'Pantai Penimbangan',
                fullDescription:
                    'Pantai penimbangan adalah pantai yang terletak di jatung kabupateng buleleng yaotu kota singaraja. Di pantai ini banyak terdapat tempat pelestarian tukik dan juga warung yang berjualan, dan juga menjadi tempat rekreasi bagi berbagai kalangan.',
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
