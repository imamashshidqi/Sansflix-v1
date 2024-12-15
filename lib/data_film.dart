class Film {
  String judul;
  String tglRilis;
  int durasi;
  double rating;
  String image;
  double harga;

  Film(
      {required this.judul,
      required this.tglRilis,
      required this.durasi,
      required this.rating,
      required this.image,
      required this.harga});
}

var listFilm = [
  Film(
    judul: "Avenger Endgame",
    tglRilis: "2019-04-26",
    durasi: 181,
    rating: 8.4,
    image: "images/Avenger-Endgame.jpeg",
    harga: 45000,
  ),
  Film(
    judul: "Avenger Infinity Wars",
    tglRilis: "2018-04-27",
    durasi: 149,
    rating: 8.4,
    image: "images/avengers-infinity-war.jpg",
    harga: 50000,
  ),
  Film(
    judul: "Captain America",
    tglRilis: "2011-07-22",
    durasi: 124,
    rating: 6.9,
    image: "images/Captain-America.jpeg",
    harga: 46000,
  ),
  Film(
    judul: "Doctor Strange in the Multiverse of Madness",
    tglRilis: "2022-05-06",
    durasi: 126,
    rating: 6.9,
    image: "images/DrStrange-mom.jpeg",
    harga: 42000,
  ),
  Film(
    judul: "Loki",
    tglRilis: "2021-06-9",
    durasi: 64,
    rating: 8.2,
    image: "images/loki.jpg",
    harga: 48000,
  ),
  Film(
    judul: "Spider-Man: No Way Home",
    tglRilis: "2021-12-17",
    durasi: 148,
    rating: 8.2,
    image: "images/Spiderman-nwh.jpeg",
    harga: 40000,
  ),
];
