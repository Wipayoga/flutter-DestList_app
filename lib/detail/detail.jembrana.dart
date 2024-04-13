import 'package:flutter/material.dart';

class DetailJembrana extends StatefulWidget {
  const DetailJembrana({Key? key}) : super(key: key);

  @override
  _DetailJembrana createState() => _DetailJembrana();
}

class _DetailJembrana extends State<DetailJembrana> {
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
                image: 'assets/image/jembrana.jpg',
                description: 'Kota Jembrana',
                fullDescription:
                    'Jembrana adalah kabupaten di bagian barat daya Pulau Bali, Indonesia, terkenal dengan pantai indahnya dan kehidupan pedesaan yang tenang. Salah satu daya tariknya adalah Pantai Medewi yang populer untuk berselancar, serta kegiatan pertanian yang subur di daerah pedalaman. Kabupaten ini menawarkan pengalaman yang lebih tenang dan autentik bagi para wisatawan yang mencari sisi Bali yang lebih terpencil.',
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
