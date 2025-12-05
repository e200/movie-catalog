import 'dart:convert';

import 'package:movie_catalog/movie/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  static final repository = MovieRepository();

  final baseURL = 'https://api.jikan.moe/v4';

  late final List<Movie>? _movies;

  MovieRepository({List<Movie>? movies}) {
    _movies = movies;
  }

  void add(Movie movie) {}

  Movie? fetch(String s) {
    return null;
  }

  Future<Map<String, List<Movie>>> fetchAllByGenre() async {
    final response = await http.get(
      Uri.parse('https://api.jikan.moe/v4/anime'),
    );

    final decodedJson = jsonDecode(response.body);

    final movieGenres = <String, List<Movie>>{};

    for (var e in (decodedJson as Map<String, dynamic>)['data'] as List) {
      final jsonMovie = (e as Map<String, dynamic>);

      final movie = Movie(
        id: jsonMovie['mal_id'].toString(),
        title: jsonMovie['titles'][0]['title'],
        subititle: jsonMovie['title_japanese'],
        coverUrl: jsonMovie['images']['jpg']['large_image_url'],
        description: jsonMovie['synopsis'],
      );

      for (var element in jsonMovie['genres']) {
        final movieGenre = element['name'];

        if (movieGenres[movieGenre] == null) {
          movieGenres[movieGenre] = [];
        }

        movieGenres[movieGenre]!.add(movie);
      }
    }

    return movieGenres;
  }

  Future<List<Movie>> fetchAll() async {
    final response = await http.get(Uri.parse('$baseURL/anime'));

    final movies = (jsonDecode(response.body));
    print(movies['data'][0]);
    return Future.value(List.empty());
  }

  List<Movie> search(String s) {
    return List.empty();
  }
}
