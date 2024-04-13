import 'package:flutter/material.dart';

class DetailBatukaru extends StatefulWidget {
  const DetailBatukaru({Key? key}) : super(key: key);

  @override
  _DetailBatukaru createState() => _DetailBatukaru();
}

class _DetailBatukaru extends State<DetailBatukaru> {
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
                image: 'assets/image/batukaru.jpg',
                description: 'Gunung Batukaru',
                fullDescription:
                    'Gunung Batukaru, gunung berapi kedua tertinggi di Pulau Bali, Indonesia, menawarkan pendakian menantang dengan pemandangan alam yang spektakuler. Dengan nilai spiritual yang tinggi bagi masyarakat Bali, gunung ini adalah destinasi yang menarik bagi para pendaki dan pencari petualangan.',
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
