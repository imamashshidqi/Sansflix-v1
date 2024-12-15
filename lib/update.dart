import 'package:flutter/material.dart';
import 'package:sanflix_ta/data_film.dart';

class Update extends StatefulWidget {
  const Update(
      {super.key,
      required this.nama,
      required this.rating,
      required this.harga});
  final String nama;
  final double rating;
  final double harga;

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final _formKey = GlobalKey<FormState>();
  late String _nama;
  late double _rating;
  late double _harga;

  @override
  void initState() {
    super.initState();
    _nama = widget.nama;
    _rating = widget.rating;
    _harga = widget.harga;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Film',
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
                    initialValue: _nama,
                    decoration: const InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _nama = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    initialValue: _rating.toString(),
                    decoration: const InputDecoration(
                      labelText: "Rating Film",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Rating Film tidak boleh kosong.';
                      }
                      final ratingValue = double.tryParse(value);
                      if (ratingValue == null ||
                          ratingValue < 0.1 ||
                          ratingValue > 10) {
                        return 'Rating Film harus antara 0.1 dan 10.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _rating = double.parse(value!);
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    initialValue: _harga.toString(),
                    decoration: const InputDecoration(
                      labelText: "Harga",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harga Film tidak boleh kosong.';
                      }
                      final hargaValue = double.tryParse(value);
                      if (hargaValue == null || hargaValue < 1) {
                        return 'Harga Film harus lebih besar dari Rp.1';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _harga = double.parse(value!);
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
                            judul: _nama,
                            tglRilis: '',
                            durasi: 0,
                            rating: _rating,
                            image: '',
                            harga: _harga,
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
