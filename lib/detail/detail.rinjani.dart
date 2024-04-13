import 'package:flutter/material.dart';

class DetailRinjani extends StatefulWidget {
  const DetailRinjani({Key? key}) : super(key: key);

  @override
  _DetailRinjani createState() => _DetailRinjani();
}

class _DetailRinjani extends State<DetailRinjani> {
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
                image: 'assets/image/rinjani.jpg',
                description: 'Gunung Rinjani',
                fullDescription:
                    'Gunung Rinjani, ikon Pulau Lombok, menawarkan pengalaman mendebarkan bagi para pendaki. Dengan danau kawah Segara Anak yang mempesona, medan yang beragam, dan pemandangan matahari terbit yang luar biasa, gunung ini menjadi destinasi impian bagi para petualang.',
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
