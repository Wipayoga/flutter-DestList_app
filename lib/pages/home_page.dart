import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:destlist_app/pages/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:destlist_app/pages/favorite_page.dart';
import 'package:destlist_app/pages/page_utama.dart';
import 'package:destlist_app/pages/profil_page.dart';
import 'package:destlist_app/pages/setting_page.dart';
import 'package:destlist_app/pages/about_drawer.dart';
import 'package:destlist_app/sqlite/crud_pages.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  List<Widget> pageList = [
    UtamaPage(),
    const FavoritePage(),
    const SettingPage(),
    const ProfilPage(),
  ];

  List<String> appBarTitles = [
    'Home',
    'Favorite',
    'Setting',
    'Profile',
  ];

  void setPage(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[pageIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 56, 105, 145),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'App Drawer',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Destination List App',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('About App'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutDrawer()));
              },
            ),
            ListTile(
              title: const Text('Task 1 API'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsScreen()));
                // Action when "Task 1 API" button is pressed
              },
            ),
            ListTile(
              title: const Text('Task 2 CRUD'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CrudPage()));
                // Action when "Task 2 CRUD" button is pressed
              },
            ),
          ],
        ),
      ),
      body: pageList[pageIndex],
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          setPage(value);
        },
        backgroundColor: const Color.fromARGB(255, 54, 238, 244),
        items: const [
          Icon(Icons.home),
          Icon(Icons.favorite),
          Icon(Icons.settings),
          Icon(Icons.person),
        ],
      ),
    );
  }
}
