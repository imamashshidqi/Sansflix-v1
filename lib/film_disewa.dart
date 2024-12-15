import 'package:flutter/material.dart';
import 'package:sanflix_ta/detail_film.dart';

class FilmDibeli extends StatefulWidget {
  const FilmDibeli({super.key});

  @override
  State<FilmDibeli> createState() => _FilmDibeliState();
}

class _FilmDibeliState extends State<FilmDibeli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Film yang di Sewa",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: filmDisewa.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.movie),
              title: Text(filmDisewa[index].judul),
              subtitle: Text(
                  "Rating: ${filmDisewa[index].rating}/10 | Harga: Rp.${filmDisewa[index].harga}"),
            ),
          );
        },
      ),
    );
  }
}
