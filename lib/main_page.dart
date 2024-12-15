import 'package:flutter/material.dart';
import 'package:sanflix_ta/cari_film.dart';
import 'package:sanflix_ta/list_film.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sansflix 🍿"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: FilmSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[400],
              ),
              child: const Text(
                'Menu Sansflix 🍿',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Halaman Utama'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_home_outlined),
              title: const Text('Halaman Admin'),
              onTap: () {
                Navigator.pushNamed(context, '/admin');
              },
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Film yang di Sewa'),
              onTap: () {
                Navigator.pushNamed(context, '/disewa');
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const FilmList(gridCount: 2);
          } else if (constraints.maxWidth <= 1200) {
            return const FilmList(gridCount: 4);
          } else {
            return const FilmList(gridCount: 6);
          }
        },
      ),
    );
  }
}
