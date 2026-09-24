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

}
