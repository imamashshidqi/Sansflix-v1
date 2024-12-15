import 'package:flutter/material.dart';
import 'package:sanflix_ta/admin_page.dart';
import 'package:sanflix_ta/film_disewa.dart';
import 'package:sanflix_ta/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sansflix 🍿",
      home: const MainPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/admin':
            return MaterialPageRoute(builder: (context) => const AdminPage());
          case '/disewa':
            return MaterialPageRoute(builder: (context) => const FilmDibeli());
          default:
            return MaterialPageRoute(builder: (context) => const MainPage());
        }
      },
    );
  }
}