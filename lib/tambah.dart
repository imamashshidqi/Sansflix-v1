import 'package:flutter/material.dart';
import 'package:sanflix_ta/data_film.dart';

class Tambah extends StatefulWidget {
  const Tambah({super.key});
  @override
  State<Tambah> createState() => _TambahState();
}

class _TambahState extends State<Tambah> {
  final _formKey = GlobalKey<FormState>();
  String judul = '';
  String tglRilis = '';
  int durasi = 0;
  double rating = 0;
  String image = '';
  double harga = 0;

  final List<String> images = [
    'images/Avenger-Endgame.jpeg',
    'images/avengers-infinity-war.jpg',
    'images/Captain-America.jpeg',
    'images/DrStrange-mom.jpeg',
    'images/loki.jpg',
    'images/Spiderman-nwh.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Film',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Judul Film",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Tanggal Rilis",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal Rilis tidak boleh kosong.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        tglRilis = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Durasi (menit)",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Durasi tidak boleh kosong.';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Durasi harus berupa angka.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        durasi = int.parse(value!);
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Rating",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Rating tidak boleh kosong.';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Rating harus berupa angka.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        rating = double.parse(value!);
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  DropdownButtonFormField<String>(
                    value: images.isNotEmpty ? images[0] : null,
                    decoration: const InputDecoration(
                      labelText: "Pilih Gambar",
                      border: OutlineInputBorder(),
                    ),
                    items: images.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        image = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Gambar tidak boleh kosong.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        image = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Harga (Rp.)",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harga tidak boleh kosong.';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Harga harus berupa angka.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        harga = double.parse(value!);
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Film berhasil disimpan."),
                          ),
                        );
                        Navigator.pop(
                          context,
                          Film(
                            judul: judul,
                            tglRilis: tglRilis,
                            durasi: durasi,
                            rating: rating,
                            image: image,
                            harga: harga,
                          ),
                        );
                      }
                    },
                    child: const Text("Simpan"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
