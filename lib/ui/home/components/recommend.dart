import 'package:flutter/material.dart';
import 'package:stream_view/consts.dart';

class Recommend extends StatelessWidget {
  Recommend({super.key});

  final List<Map<String, String>> moviesRecommend = [
    {
      "title": "The Greatest Sh..",
      "genre": "Romance, Drama",
      "image": "assets/images/movie_img/movie_1.png",
    },
    {
      "title": "The Dark Knight",
      "genre": "Action, Drama",
      "image": "assets/images/movie_img/movie_2.png",
    },
    {
      "title": "Inception",
      "genre": "Sci-Fi, Action",
      "image": "assets/images/movie_img/movie_3.png",
    },
    {
      "title": "Interstellar",
      "genre": "Sci-Fi, Drama",
      "image": "assets/images/movie_img/movie_5.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child:
       SizedBox(
        height: 200,  
        child: ListView.builder(
          scrollDirection: Axis.horizontal,  
          itemCount: moviesRecommend.length, 
          itemBuilder: (context, index) {
            return _buildRecommend(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildRecommend(BuildContext context, int index) {
    var movie = moviesRecommend[index]; 

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MovieDetailScreen(movie: movie),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(left: defaultPadding),
            child: Text("Recommended for you",
              style: TextStyle(
                color: blackTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            ),
            Container(
              height: 240,  // Gambar film
              width: 160,  // Gambar film
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(movie['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie['title']!,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              movie['genre']!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



