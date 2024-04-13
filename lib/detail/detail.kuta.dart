import 'package:flutter/material.dart';

class DetailKuta extends StatefulWidget {
  const DetailKuta({Key? key}) : super(key: key);

  @override
  _DetailKuta createState() => _DetailKuta();
}

class _DetailKuta extends State<DetailKuta> {
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
                image: 'assets/image/kuta.jpg',
                description: 'Pantai Kuta',
                fullDescription:
                    'Pantai Kuta terkenal dengan pasir putih lembutnya dan ombak yang cocok untuk berselancar. Matahari terbenam di atas cakrawala laut menjadi pemandangan yang memukau, sementara kehidupan malamnya yang ramai menawarkan hiburan yang menyenangkan bagi para pengunjung.',
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
