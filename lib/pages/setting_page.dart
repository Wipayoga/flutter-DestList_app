import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15.0), // Margin at the top
              const Icon(Icons.settings, size: 28.0), // Person icon on top
              const SizedBox(height: 2.0), // Spacing between icon and text
              Text('DestList Setting'), // Username below the icon
              const SizedBox(height: 15.0), // Margin at the bottom
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Account section
          buildAccountSection(context),
          // Notifications section
          buildNotificationsSection(context),
          // Settings section
          buildSettingsSection(context),
          // Akses section
          buildAksesSection(context),
          // Log Out section
          buildLogOutSection(context),
          // bantuan
          buildLaporkanSection(context),
          // bantuan
          buildBantuanSection(context),
          // Divider
          const Divider(thickness: 1),
        ],
      ),
    );
  }

  // Helper methods to build each section - replace with your specific UI logic
  Widget buildAccountSection(BuildContext context) {
    return ListTile(
      title: Text('Akun'),
      leading: Icon(Icons.account_circle),
    );
  }

  Widget buildNotificationsSection(BuildContext context) {
    return ListTile(
      title: Text('Privasi'),
      leading: Icon(Icons.private_connectivity),
    );
  }

  Widget buildSettingsSection(BuildContext context) {
    return ListTile(
      title: Text('Notifikasi'),
      leading: Icon(Icons.notifications),
    );
  }

  Widget buildAksesSection(BuildContext context) {
    return ListTile(
      title: Text('Aksesbilitas'),
      leading: Icon(Icons.accessibility),
    );
  }

  Widget buildLogOutSection(BuildContext context) {
    return ListTile(
      title: Text('Bahasa'),
      leading: Icon(Icons.abc),
    );
  }

  Widget buildLaporkanSection(BuildContext context) {
    return ListTile(
      title: Text('Laporkan'),
      leading: Icon(Icons.report),
    );
  }

  Widget buildBantuanSection(BuildContext context) {
    return ListTile(
      title: Text('Bantuan'),
      leading: Icon(Icons.help_outline),
    );
  }

}
