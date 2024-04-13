import 'package:flutter/material.dart';

class DetailBatur extends StatefulWidget {
  const DetailBatur({Key? key}) : super(key: key);

  @override
  _DetailBatur createState() => _DetailBatur();
}

class _DetailBatur extends State<DetailBatur> {
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
                image: 'assets/image/batur.jpg',
                description: 'Gunung Batur',
                fullDescription:
                    'Gunung Batur adalah gunung berapi aktif yang terletak di Bali, Indonesia. Dikenal dengan pemandangan matahari terbitnya yang menakjubkan, Gunung Batur menarik banyak pendaki setiap tahunnya. Pendakian ke puncaknya relatif singkat namun menantang, dan pengunjung dapat menikmati panorama luar biasa dari ketinggian. Di sekitarnya, terdapat danau kawah yang indah, menambah pesona alam Gunung Batur.',
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
