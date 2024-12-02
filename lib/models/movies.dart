
class Movie {

  final String image, title, description, genre;
  final int id, duration, releaseDate;


  Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.genre,
    required this.duration,
    required this.releaseDate,
    required this.description,
  });
}

 List<Movie> movie = [
  Movie(
      id: 1,
      title: "The Greatest Showman",
      image: "assets/images/movie_img/movie_1.png",
      genre: "Sci-Fi",
      duration: 120,
      releaseDate: 2021,
      description: dummyText,
      ),
  Movie(
      id: 2,
      title: "Joy",
      image: "assets/images/movie_img/movie_2.png",
      genre: "Sci-Fi",
      duration: 120,
      releaseDate: 2021,
      description: dummyText,
      ),
  Movie(
      id: 3,
      title: "Parasite",
      image: "assets/images/movie_img/movie_3.png",
      genre: "Drama",
      duration: 120,
      releaseDate: 2021,
      description: dummyText,
      ),
  Movie(
      id: 4,
      title: "Stranger Things",
      image: "assets/images/movie_img/movie_4.png",
      genre: "Horor Mystery",
      duration: 120,
      releaseDate: 2021,
      description: dummyText,
      ),
  Movie(
      id: 5,
      title: "Stranded",
      image: "assets/images/movie_img/movie_5.png",
      genre: "Action, Drama",
      duration: 120,
      releaseDate: 2021,
      description: dummyText,
      ),
];

String dummyText =
    "The film opens with Phineas Taylor 'P.T.' Barnum (Hugh Jackman) joining his circus troupe in a song ('The Greatest Show'), playing to an enthusiastic crowd as he and his performers put on a dazzling show.We cut to Barnum as a young boy (Ellis Rubin) in the 1800's, working with his tailor father Philo";

String descriptionText = "ikan sepat ikan cucut, hegi suka lino";
