import 'package:flutter/material.dart';
import 'package:sanflix_ta/data_film.dart';
import 'package:sanflix_ta/tambah.dart';
import 'package:sanflix_ta/update.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Film",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: listFilm.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.movie),
              title: Text(listFilm[index].judul),
              subtitle: Text(
                  "Rating: ${listFilm[index].rating}/10 | Harga: Rp.${listFilm[index].harga}"),
              trailing: PopupMenuButton(
                initialValue: null,
                onSelected: (pilihan) async {
                  if (pilihan == "Update") {
                    var editFilm = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Update(
                          nama: listFilm[index].judul,
                          rating: listFilm[index].rating,
                          harga: listFilm[index].harga,
                        ),
                      ),
                    );
                    if (editFilm != null) {
                      setState(() {
                        listFilm[index] = Film(
                          judul: editFilm.judul,
                          tglRilis: listFilm[index].tglRilis,
                          durasi: listFilm[index].durasi,
                          rating: editFilm.rating,
                          image: listFilm[index].image,
                          harga: editFilm.harga,
                        );
                      });
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Hapus Film?"),
                        content: const Text("Film akan dihapus."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                listFilm.removeAt(index);
                              });
                              Navigator.pop(context);
                            },
                            child: const Text("Delete"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      value: "Update",
                      child: Text("Update"),
                    ),
                    const PopupMenuItem(
                      value: "Delete",
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ];
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var newFilm = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Tambah(),
            ),
          );
          if (newFilm != null) {
            setState(() {
              listFilm.add(newFilm);
            });
          }
        },
        label: const Text("Tambah Film"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
