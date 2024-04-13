import 'package:flutter/material.dart';

class DetailAmlapura extends StatefulWidget {
  const DetailAmlapura({Key? key}) : super(key: key);

  @override
  _DetailAmlapura createState() => _DetailAmlapura();
}

class _DetailAmlapura extends State<DetailAmlapura> {
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
                image: 'assets/image/amlapura.jpg',
                description: 'Kota Amlapura',
                fullDescription:
                    'Amlapura, kota kecil di timur Pulau Bali, Indonesia, terkenal dengan Istana Taman Ujung dan Pasar Amlapura yang hidup. Kota ini menawarkan pengalaman autentik bagi para pengunjung yang ingin menjelajahi sisi Bali yang lebih tradisional dan terpencil.',
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
