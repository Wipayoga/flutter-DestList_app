import 'package:flutter/material.dart';

class DetailDenpasar extends StatefulWidget {
  const DetailDenpasar({Key? key}) : super(key: key);

  @override
  _DetailDenpasar createState() => _DetailDenpasar();
}

class _DetailDenpasar extends State<DetailDenpasar> {
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
                image: 'assets/image/denpasar.jpg',
                description: 'Kota Denpasar',
                fullDescription:
                  'Denpasar adalah ibu kota Provinsi Bali, Indonesia, yang terkenal dengan Pasar Badungnya yang ramai dan Museum Bali yang kaya akan sejarah dan seni. Sebagai pusat administratif dan komersial pulau, Denpasar menawarkan pengalaman urban yang berbeda dengan keragaman budaya Bali yang kental.',
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
