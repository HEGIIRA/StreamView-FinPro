import 'package:flutter/material.dart';
import 'package:stream_view/consts.dart';
import 'package:stream_view/models/movies.dart';

class Recommend extends StatelessWidget {
  const Recommend({
    super.key,
    required this.press,
    required this.movies, // Menggunakan tipe List<Movie> untuk daftar film
  });

  final VoidCallback press;
  final List<Movie> movies; // Daftar film yang diterima sebagai parameter

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recommended for you",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: blackTextColor,
                    decoration: TextDecoration.none,
                  ),
                ),
                TextButton(
                  onPressed: press,
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          // List horizontal untuk film
          SizedBox(
            height: 300, // Tinggi list view
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Scroll horizontal
              itemCount: movies.length, // Menggunakan movies.length sesuai parameter
              itemBuilder: (context, index) =>
                  _buildRecommend(context, movies[index]), // Ambil data berdasarkan index
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk item rekomendasi
  GestureDetector _buildRecommend(BuildContext context, Movie movieItem) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(movieItem.image), // Ambil path gambar dari model
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movieItem.title.length > 15
              ? '${movieItem.title.substring(0, 15)}...' // Jika teks lebih dari 15 karakter, tampilkan 15 huruf + ...
              : movieItem.title, // Jika teks kurang dari atau sama dengan 15 karakter, tampilkan seluruhnya
              style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: blackTextColor,
              ),
              maxLines: 1, //nge batasin cuma bisa 1 baris gitu
              overflow: TextOverflow.ellipsis, //nh ini biar klo lebih bakal ada titik-titik (Hegira me..)
            ),
            const SizedBox(height: 5),
            Text(
              movieItem.genre, // Ambil genre dari model
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
                fontSize: 13,
                color: greyDarkTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
