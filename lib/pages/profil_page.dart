import 'package:destlist_app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'intro_page.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10.0), // Margin at the top
              const Icon(Icons.person, size: 30.0), // Person icon on top
              const SizedBox(height: 4.0), // Spacing between icon and text
              Text('User 123'), // Username below the icon
              const SizedBox(height: 8.0), // Margin at the bottom
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Account section
          buildAbautSection(context),
          // Notifications section
          buildEmailSection(context),
          // Settings section
          buildNoWASection(context),
          //beralih akunn
          buildBeralihAKunSection(context),
          // Log Out section
          buildLogOutSection(context, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SplashPage(),
              ),
            );
          }),
          // Divider
          const Divider(thickness: 1),
        ],
      ),
    );
  }

  // Helper methods to build each section - replace with your specific UI logic
  Widget buildAbautSection(BuildContext context) {
    return ListTile(
      title: Text('Tentang User'),
      leading: Icon(Icons.account_circle),
    );
  }

  Widget buildEmailSection(BuildContext context) {
    return ListTile(
      title: Text('E - Mail'),
      leading: Icon(Icons.email),
    );
  }

  Widget buildNoWASection(BuildContext context) {
    return ListTile(
      title: Text('Nomor WhatsApp'),
      leading: Icon(Icons.call),
    );
  }

  Widget buildBeralihAKunSection(BuildContext context) {
    return ListTile(
      title: Text('Beralih Akun'),
      leading: Icon(Icons.person),
    );
  }

  // Modified method to include a GestureDetector for Log Out section
  Widget buildLogOutSection(BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Call onTap function when pressed
      child: ListTile(
        title: Text('Log Out'),
        leading: Icon(Icons.logout),
      ),
    );
  }
}
