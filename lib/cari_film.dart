import 'package:flutter/material.dart';
import 'package:sanflix_ta/data_film.dart';
import 'package:sanflix_ta/detail_film.dart';

class FilmSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = listFilm
        .where((film) => film.judul.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final film = results[index];
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          title: Text(
            film.judul,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Rilis: ${film.tglRilis} | Rating: ${film.rating}"),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              film.image,
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailFilm(film: film),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = listFilm
        .where((film) => film.judul.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final film = suggestions[index];
        return ListTile(
          title: Text(film.judul),
          subtitle: Text("Rilis: ${film.tglRilis} | Rating: ${film.rating}"),
          leading: Image.asset(film.image),
          onTap: () {
            query = film.judul;
            showResults(context);
          },
        );
      },
    );
  }
}
