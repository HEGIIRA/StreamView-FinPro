// import 'package:flutter/material.dart';

class Movie {

  final String image, title, description, genre, rating;
  final int id, duration, releaseDate;
  // final double price;

  Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.genre,
    required this.rating,
    required this.duration,
    required this.releaseDate,
    required this.description,
  });
}

 List<Movie> movie = [
  Movie(
      id: 1,
      title: "The Greatest Showman",
      image: "assets/images/product_img/p_1.png",
      genre: "Sci-Fi",
      rating: "4.5",
      duration: 120,
      releaseDate: 2021,
      description: dummyText,
      ),
];

String dummyText =
    "The film opens with Phineas Taylor 'P.T.' Barnum (Hugh Jackman) joining his circus troupe in a song ('The Greatest Show'), playing to an enthusiastic crowd as he and his performers put on a dazzling show.We cut to Barnum as a young boy (Ellis Rubin) in the 1800's, working with his tailor father Philo";

String descriptionText = "ikan sepat ikan cucut, hegi suka lino";
