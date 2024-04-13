import 'package:destlist_app/pages/about_drawer.dart';
import 'package:destlist_app/pages/home_page.dart';
import 'package:destlist_app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:destlist_app/utils/my_http_overrides.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
