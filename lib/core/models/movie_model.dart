class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final double rating;

  const Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.rating,
  });
  static final List<Movie> movies = [
    const Movie(
      id: '1',
      title: 'Black Widow',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
      rating: 7.7,
    ),
    const Movie(
      id: '2',
      title: 'The Batman',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg',
      rating: 7.7,
    ),
    const Movie(
      id: '3',
      title: '1917',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
      rating: 7.7,
    ),
    const Movie(
      id: '4',
      title: 'Avengers',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
      rating: 7.7,
    ),
    const Movie(
      id: '5',
      title: 'Avengers: Endgame',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
      rating: 7.7,
    ),
    const Movie(
      id: '6',
      title: 'Doctor Strange in the Multiverse of Madness',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
      rating: 7.5,
    ),
    const Movie(
      id: '7',
      title: 'Black Panther',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
      rating: 7.4,
    ),
    const Movie(
      id: '8',
      title: 'Spider-Man: No Way Home',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
      rating: 8.0,
    ),
    const Movie(
      id: '9',
      title: 'Godzilla vs. Kong',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg',
      rating: 7.2,
    ),
    const Movie(
      id: '10',
      title: 'Fast & Furious Presents: Hobbs & Shaw',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
      rating: 6.5,
    ),
    const Movie(
      id: '11',
      title: 'Iron Man',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/78lPtwv72eTNqFW9COBYI0dWDJa.jpg',
      rating: 7.6,
    ),
    const Movie(
      id: '12',
      title: 'Wednesday',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
      rating: 8.1,
    ),
  ];
}
