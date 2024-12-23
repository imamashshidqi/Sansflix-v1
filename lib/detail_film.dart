import 'package:flutter/material.dart';
import 'package:sanflix_ta/data_film.dart';

class DetailFilm extends StatefulWidget {
  final Film film;

  const DetailFilm({super.key, required this.film});

  @override
  State<DetailFilm> createState() => _DetailFilmState();
}

List<Film> filmDisewa = [];

class _DetailFilmState extends State<DetailFilm> {
  void _saveFilm(Film film) {
    setState(() {
      filmDisewa.add(film);
    });
    Text('Film ${film.judul} berhasil di Sewa.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.judul),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Image.asset(widget.film.image),
          const SizedBox(height: 16),
          Text(
            'Judul: ${widget.film.judul}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Tanggal Rilis: ${widget.film.tglRilis}'),
          Text('Durasi: ${widget.film.durasi} menit'),
          Text('Rating: ${widget.film.rating}'),
          Text('Harga: Rp${widget.film.harga}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _saveFilm(widget.film);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Film ${widget.film.judul} berhasil di Sewa!'),
                ),
              );
            },
            child: const Text('Sewa Film'),
          ),
        ],
      ),
    );
  }
}
