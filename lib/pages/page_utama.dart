import 'package:destlist_app/detail/detail.agung.dart';
import 'package:destlist_app/detail/detail.amlapura.dart';
import 'package:destlist_app/detail/detail.batukaru.dart';
import 'package:destlist_app/detail/detail.batur.dart';
import 'package:destlist_app/detail/detail.denpasar.dart';
import 'package:destlist_app/detail/detail.jembrana.dart';
import 'package:destlist_app/detail/detail.kuta.dart';
import 'package:destlist_app/detail/detail.pandawa.dart';
import 'package:destlist_app/detail/detail.rinjani.dart';
import 'package:destlist_app/detail/detail.sanur.dart';
import 'package:flutter/material.dart';
import 'package:destlist_app/detail/detail.penimbangan.dart';
import 'package:destlist_app/detail/detail.singaraja.dart';

class Destination {
  final String image;
  final String name;
  final Widget page;

  Destination({required this.image, required this.name, required this.page});
}

class UtamaPage extends StatelessWidget {
  final List<Destination> destinations = [
    // Dest Gunung
    Destination(
      image: 'assets/image/agung.jpg', 
      name: 'Gunung Agung',
      page: const DetailAgung(),
    ),
    Destination(
      image: 'assets/image/batur.jpg', 
      name: 'Gunung Batur',
      page: const DetailBatur(),
    ),
    Destination(
      image: 'assets/image/batukaru.jpg', 
      name: 'Gunung Batukaru',
      page: const DetailBatukaru(),
    ),Destination(
      image: 'assets/image/rinjani.jpg', 
      name: 'Gunung Rinjani',
      page: const DetailRinjani(),
    ),

    // Dest Kota
    Destination(
      image: 'assets/image/singaraja1.jpg', 
      name: 'Kota Singaraja',
      page: const DetailSingaraja(),
    ),
    Destination(
      image: 'assets/image/denpasar.jpg', 
      name: 'Kota Denpasar',
      page: const DetailDenpasar(),
    ),Destination(
      image: 'assets/image/amlapura.jpg', 
      name: 'Kota Amlapura',
      page: const DetailAmlapura(),
    ),Destination(
      image: 'assets/image/jembrana.jpg', 
      name: 'Kota Jembrana',
      page: const DetailJembrana(),
    ),

    // Dest Pantai
    Destination(
      image: 'assets/image/penimbangan.jpg', 
      name: 'Pantai Penimbangan',
      page: const DetailPenimbangan(),
    ),
    Destination(
      image: 'assets/image/kuta.jpg', 
      name: 'Pantai Kuta',
      page: const DetailKuta(),
    ),
    Destination(
      image: 'assets/image/pandawa.jpg', 
      name: 'Pantai Pandawa',
      page: const DetailPandawa(),
    ),
    Destination(
      image: 'assets/image/sanur.jpg', 
      name: 'Pantai Sanur',
      page: const DetailSanur(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.hiking)),
              Tab(icon: Icon(Icons.beach_access)),
              Tab(icon: Icon(Icons.location_city)),
            ],
          ),
          title: Container(
            padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Cari Destinasi?',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        
        body: TabBarView(
          children: [
            // Tab Gunung
            ListView.builder(
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                if (destinations[index].name == 'Gunung Agung' || destinations[index].name == 'Gunung Batur' || destinations[index].name == 'Gunung Batukaru' || destinations[index].name == 'Gunung Rinjani') {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => destinations[index].page),
                      );
                    },
                    child: _buildCard(
                      image: destinations[index].image,
                      description: destinations[index].name,
                    ),
                  );
                } else {
                  return Container(); // Return empty container for other destinations
                }
              },
            ),
            
            // Tab Pantai
            ListView.builder(
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                if (destinations[index].name == 'Pantai Penimbangan' || destinations[index].name == 'Pantai Kuta' || destinations[index].name == 'Pantai Pandawa' || destinations[index].name == 'Pantai Sanur') {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => destinations[index].page),
                      );
                    },
                    child: _buildCard(
                      image: destinations[index].image,
                      description: destinations[index].name,
                    ),
                  );
                } else {
                  return Container(); // Return empty container for other destinations
                }
              },
            ),

            // Tab Kota
            ListView.builder(
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                if (destinations[index].name == 'Kota Singaraja' || destinations[index].name == 'Kota Denpasar' || destinations[index].name == 'Kota Amlapura' || destinations[index].name == 'Kota Jembrana') {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => destinations[index].page),
                      );
                    },
                    child: _buildCard(
                      image: destinations[index].image,
                      description: destinations[index].name,
                    ),
                  );
                } else {
                  return Container(); // Return empty container for other destinations
                }
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String image, required String description}) {
    return Card(
      elevation: 4,
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
            child: Text(
              description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}