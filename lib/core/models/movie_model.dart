class CastMember {
  final String name;
  final String character;
  final String imageUrl;

  const CastMember({
    required this.name,
    required this.character,
    required this.imageUrl,
  });
}

class MovieResponse {
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  MovieResponse({this.status, this.statusMessage, this.data, this.meta});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }
}

class Torrents {
  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  Torrents({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  Torrents.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
}

class Meta {
  int? apiVersion;
  String? executionTime;

  Meta({this.apiVersion, this.executionTime});

  Meta.fromJson(Map<String, dynamic> json) {
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }
}

class Data {
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<Movie>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  Data.fromJson(Map<String, dynamic> json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = <Movie>[];
      json['movies'].forEach((v) {
        movies!.add(Movie.fromJson(v));
      });
    }
  }
}

class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final double rating;
  final int year;
  final String summary;
  final int durationMinutes;
  final int likes;
  final List<String> screenshotUrls;
  final List<CastMember> cast;
  final List<String> genres;

  const Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.rating,
    this.year = 0,
    this.summary = '',
    this.durationMinutes = 0,
    this.likes = 0,
    this.screenshotUrls = const [],
    this.cast = const [],
    this.genres = const [],
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: '${json['id']}',
      title: json['title'] as String? ?? 'Untitled movie',
      posterUrl:
          json['large_cover_image'] as String? ??
          json['medium_cover_image'] as String? ??
          '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      year: json['year'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'large_cover_image': posterUrl,
      'rating': rating,
      'year': year,
    };
  }

  static final List<Movie> movies = [
    Movie(
      id: '1',
      title: 'Black Widow',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
      rating: 7.7,
      year: 2021,
      durationMinutes: 134,
      likes: 12,
      summary:
          "Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
        'https://image.tmdb.org/t/p/w780/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
        'https://image.tmdb.org/t/p/w780/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Scarlett Johansson',
          character: 'Natasha Romanoff / Black Widow',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
        ),
        CastMember(
          name: 'Florence Pugh',
          character: 'Yelena Belova',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
        ),
        CastMember(
          name: 'David Harbour',
          character: 'Alexei Shostakov / Red Guardian',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
        ),
      ],
      genres: const ['Action', 'Adventure', 'Sci-Fi'],
    ),
    Movie(
      id: '2',
      title: 'The Batman',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg',
      rating: 7.7,
      year: 2022,
      durationMinutes: 176,
      likes: 20,
      summary:
          "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler, who targets Gotham's elite with a series of sadistic schemes.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/74xTEgt7R36Fpooo50r9T25onhq.jpg',
        'https://image.tmdb.org/t/p/w780/74xTEgt7R36Fpooo50r9T25onhq.jpg',
        'https://image.tmdb.org/t/p/w780/74xTEgt7R36Fpooo50r9T25onhq.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Robert Pattinson',
          character: 'Bruce Wayne / Batman',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/74xTEgt7R36Fpooo50r9T25onhq.jpg',
        ),
        CastMember(
          name: 'Zoë Kravitz',
          character: 'Selina Kyle / Catwoman',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/74xTEgt7R36Fpooo50r9T25onhq.jpg',
        ),
        CastMember(
          name: 'Paul Dano',
          character: 'Edward Nashton / Riddler',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/74xTEgt7R36Fpooo50r9T25onhq.jpg',
        ),
      ],
      genres: const ['Action', 'Crime', 'Drama'],
    ),
    Movie(
      id: '3',
      title: '1917',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
      rating: 7.7,
      year: 2019,
      durationMinutes: 119,
      likes: 18,
      summary:
          "At the height of the First World War, two young British soldiers are given a seemingly impossible mission: deliver a message deep in enemy territory that will stop a deadly attack on hundreds of soldiers, one of the two men's own brother among them.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
        'https://image.tmdb.org/t/p/w780/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
        'https://image.tmdb.org/t/p/w780/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
      ],
      cast: const [
        CastMember(
          name: 'George MacKay',
          character: 'Lance Corporal Schofield',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
        ),
        CastMember(
          name: 'Dean-Charles Chapman',
          character: 'Lance Corporal Blake',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
        ),
        CastMember(
          name: 'Benedict Cumberbatch',
          character: 'Colonel MacKenzie',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
        ),
      ],
      genres: const ['War', 'Drama', 'Action'],
    ),
    Movie(
      id: '4',
      title: 'Avengers',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
      rating: 7.7,
      year: 2012,
      durationMinutes: 143,
      likes: 25,
      summary:
          "Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
        'https://image.tmdb.org/t/p/w780/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
        'https://image.tmdb.org/t/p/w780/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Robert Downey Jr.',
          character: 'Tony Stark / Iron Man',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
        ),
        CastMember(
          name: 'Chris Evans',
          character: 'Steve Rogers / Captain America',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
        ),
        CastMember(
          name: 'Chris Hemsworth',
          character: 'Thor',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
        ),
      ],
      genres: const ['Action', 'Adventure', 'Sci-Fi'],
    ),
    Movie(
      id: '5',
      title: 'Avengers: Endgame',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
      rating: 7.7,
      year: 2019,
      durationMinutes: 181,
      likes: 30,
      summary:
          "After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more to reverse Thanos' actions and restore balance to the universe.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
        'https://image.tmdb.org/t/p/w780/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
        'https://image.tmdb.org/t/p/w780/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Robert Downey Jr.',
          character: 'Tony Stark / Iron Man',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
        ),
        CastMember(
          name: 'Chris Evans',
          character: 'Steve Rogers / Captain America',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
        ),
        CastMember(
          name: 'Scarlett Johansson',
          character: 'Natasha Romanoff / Black Widow',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
        ),
      ],
      genres: const ['Action', 'Adventure', 'Sci-Fi'],
    ),
    Movie(
      id: '6',
      title: 'Doctor Strange in the Multiverse of Madness',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
      rating: 7.5,
      year: 2022,
      durationMinutes: 90,
      likes: 15,
      summary:
          "Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        'https://image.tmdb.org/t/p/w780/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        'https://image.tmdb.org/t/p/w780/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Hayley Atwell',
          character: 'Captain Carter',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        ),
        CastMember(
          name: 'Elizabeth Olsen',
          character: 'Wanda Maximoff / The Scarlet Witch',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        ),
        CastMember(
          name: 'Rachel McAdams',
          character: 'Dr. Christine Palmer',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        ),
        CastMember(
          name: 'Charlize Theron',
          character: 'Clea',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        ),
      ],
      genres: const ['Action', 'Sci-Fi', 'Adventure', 'Fantasy', 'Horror'],
    ),
    Movie(
      id: '7',
      title: 'Black Panther',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
      rating: 7.4,
      year: 2018,
      durationMinutes: 134,
      likes: 22,
      summary:
          "T'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country's past to become a new king.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
        'https://image.tmdb.org/t/p/w780/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
        'https://image.tmdb.org/t/p/w780/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Chadwick Boseman',
          character: "T'Challa / Black Panther",
          imageUrl:
              'https://image.tmdb.org/t/p/w200/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
        ),
        CastMember(
          name: 'Michael B. Jordan',
          character: "Erik Killmonger",
          imageUrl:
              'https://image.tmdb.org/t/p/w200/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
        ),
        CastMember(
          name: 'Lupita Nyong\'o',
          character: 'Nakia',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
        ),
      ],
      genres: const ['Action', 'Adventure', 'Sci-Fi'],
    ),
    Movie(
      id: '8',
      title: 'Spider-Man: No Way Home',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
      rating: 8.0,
      year: 2021,
      durationMinutes: 148,
      likes: 35,
      summary:
          "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
        'https://image.tmdb.org/t/p/w780/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
        'https://image.tmdb.org/t/p/w780/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Tom Holland',
          character: 'Peter Parker / Spider-Man',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
        ),
        CastMember(
          name: 'Zendaya',
          character: 'MJ',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
        ),
        CastMember(
          name: 'Benedict Cumberbatch',
          character: 'Doctor Strange',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
        ),
      ],
      genres: const ['Action', 'Adventure', 'Sci-Fi'],
    ),
    Movie(
      id: '9',
      title: 'Godzilla vs. Kong',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg',
      rating: 7.2,
      year: 2021,
      durationMinutes: 113,
      likes: 10,
      summary:
          "In a time when monsters walk the Earth, humanity's fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg',
        'https://image.tmdb.org/t/p/w780/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg',
        'https://image.tmdb.org/t/p/w780/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Alexander Skarsgård',
          character: 'Nathan Lind',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg',
        ),
        CastMember(
          name: 'Millie Bobby Brown',
          character: 'Madison Russell',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg',
        ),
        CastMember(
          name: 'Rebecca Hall',
          character: 'Ilene Andrews',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg',
        ),
      ],
      genres: const ['Action', 'Sci-Fi', 'Adventure'],
    ),
    Movie(
      id: '10',
      title: 'Fast & Furious Presents: Hobbs & Shaw',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
      rating: 6.5,
      year: 2019,
      durationMinutes: 137,
      likes: 8,
      summary:
          "Lawman Luke Hobbs and outcast Deckard Shaw form an unlikely alliance when a cyber-genetically enhanced villain threatens the future of humanity.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        'https://image.tmdb.org/t/p/w780/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        'https://image.tmdb.org/t/p/w780/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Dwayne Johnson',
          character: 'Luke Hobbs',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        ),
        CastMember(
          name: 'Jason Statham',
          character: 'Deckard Shaw',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        ),
        CastMember(
          name: 'Idris Elba',
          character: 'Brixton Lore',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
        ),
      ],
      genres: const ['Action', 'Adventure', 'Sci-Fi'],
    ),
    Movie(
      id: '11',
      title: 'Iron Man',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/78lPtwv72eTNqFW9COBYI0dWDJa.jpg',
      rating: 7.6,
      year: 2008,
      durationMinutes: 126,
      likes: 27,
      summary:
          "After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil as Iron Man.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/78lPtwv72eTNqFW9COBYI0dWDJa.jpg',
        'https://image.tmdb.org/t/p/w780/78lPtwv72eTNqFW9COBYI0dWDJa.jpg',
        'https://image.tmdb.org/t/p/w780/78lPtwv72eTNqFW9COBYI0dWDJa.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Robert Downey Jr.',
          character: 'Tony Stark / Iron Man',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/78lPtwv72eTNqFW9COBYI0dWDJa.jpg',
        ),
        CastMember(
          name: 'Gwyneth Paltrow',
          character: 'Pepper Potts',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/78lPtwv72eTNqFW9COBYI0dWDJa.jpg',
        ),
        CastMember(
          name: 'Jeff Bridges',
          character: 'Obadiah Stane',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/78lPtwv72eTNqFW9COBYI0dWDJa.jpg',
        ),
      ],
      genres: const ['Action', 'Sci-Fi', 'Adventure'],
    ),
    Movie(
      id: '12',
      title: 'Wednesday',
      posterUrl:
          'https://image.tmdb.org/t/p/w500/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
      rating: 8.1,
      year: 2022,
      durationMinutes: 50,
      likes: 40,
      summary:
          "Wednesday Addams is sent to Nevermore Academy, a bizarre boarding school, where she attempts to master her psychic powers, thwart a monstrous killing spree, and solve a decades-old mystery.",
      screenshotUrls: [
        'https://image.tmdb.org/t/p/w780/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
        'https://image.tmdb.org/t/p/w780/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
        'https://image.tmdb.org/t/p/w780/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
      ],
      cast: const [
        CastMember(
          name: 'Jenna Ortega',
          character: 'Wednesday Addams',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
        ),
        CastMember(
          name: 'Gwendoline Christie',
          character: 'Larissa Weems',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
        ),
        CastMember(
          name: 'Christina Ricci',
          character: 'Marilyn Thornhill',
          imageUrl:
              'https://image.tmdb.org/t/p/w200/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
        ),
      ],
      genres: const ['Comedy', 'Horror', 'Mystery'],
    ),
  ];
}
