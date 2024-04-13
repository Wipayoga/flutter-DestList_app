import 'package:flutter/material.dart';

class DetailAgung extends StatefulWidget {
  const DetailAgung({Key? key}) : super(key: key);

  @override
  _DetailAgung createState() => _DetailAgung();
}

class _DetailAgung extends State<DetailAgung> {
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
                image: 'assets/image/agung.jpg',
                description: 'Gunung Agung',
                fullDescription:
                    'Gunung Agung di Bali, Indonesia, adalah destinasi petualangan yang menarik dengan keindahan alam yang spektakuler dan nilai spiritual yang tinggi. Pendakian menuju puncaknya menantang namun memuaskan, dengan pemandangan yang memukau sebagai imbalannya.',
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
