import 'package:flutter/material.dart';

class DetailPandawa extends StatefulWidget {
  const DetailPandawa({Key? key}) : super(key: key);

  @override
  _DetailPandawa createState() => _DetailPandawa();
}

class _DetailPandawa extends State<DetailPandawa> {
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
                image: 'assets/image/pandawa.jpg',
                description: 'Pantai Pandawa',
                fullDescription:
                    'Pantai Pandawa di Bali, Indonesia, terkenal dengan pasir putih halus dan air laut yang jernih. Terletak di antara tebing-tebing kapur yang tinggi, pantai ini menawarkan suasana yang tenang dan indah. Ideal untuk berjemur, berenang, dan menikmati keindahan matahari terbenam.',
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
