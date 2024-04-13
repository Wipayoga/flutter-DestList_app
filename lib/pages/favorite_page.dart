import 'package:destlist_app/detail/detail.agung.dart';
import 'package:destlist_app/detail/detail.denpasar.dart';
import 'package:destlist_app/detail/detail.kuta.dart';
import 'package:destlist_app/detail/detail.penimbangan.dart';
import 'package:destlist_app/detail/detail.rinjani.dart';
import 'package:destlist_app/detail/detail.singaraja.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Destinasi Favorit',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildCard(
                  image: 'assets/image/rinjani.jpg',
                  description: 'Gunung Rinjani',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailRinjani()),
                    );
                  },
                ),
                _buildCard(
                  image: 'assets/image/denpasar.jpg',
                  description: 'Kota Denpasar',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailDenpasar()),
                    );
                  },
                ),
                 _buildCard(
                  image: 'assets/image/kuta.jpg',
                  description: 'Pantai Kuta',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailKuta()),
                    );
                  },
                ),
                _buildCard(
                  image: 'assets/image/agung.jpg',
                  description: 'Gunung Agung',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailAgung()),
                    );
                  },
                ),
                _buildCard(
                  image: 'assets/image/singaraja1.jpg',
                  description: 'Kota Singaraja',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailSingaraja()),
                    );
                  },
                ),
                _buildCard(
                  image: 'assets/image/penimbangan.jpg',
                  description: 'Pantai Penimbangan',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPenimbangan()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required String image, required String description, required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap, // Panggil fungsi onTap ketika card ditekan
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
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
