import 'package:flutter/material.dart';
import 'package:sanflix_ta/data_film.dart';
import 'package:sanflix_ta/detail_film.dart';

class FilmList extends StatelessWidget {
  final int gridCount;

  const FilmList({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2 / 3.5,
      ),
      padding: const EdgeInsets.all(16.0),
      itemCount: listFilm.length,
      itemBuilder: (context, index) {
        final Film film = listFilm[index];
        return FilmListCard(film: film);
      },
    );
  }
}

class FilmListCard extends StatelessWidget {
  final Film film;
  const FilmListCard({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailFilm(film: film),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildFilmInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: Image.asset(
          film.image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildFilmInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          film.judul,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
        ),
        Text(
          '${film.rating.toString()}/10 | Rp.${film.harga.toString()}',
          style: const TextStyle(color: Colors.grey, fontSize: 12.0),
        ),
      ],
    );
  }
}
