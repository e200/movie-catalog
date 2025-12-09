import 'package:flutter_test/flutter_test.dart';
import 'package:movie_catalog/movie/model/movie.dart';
import 'package:movie_catalog/movie/repository.dart';

void main() {
 /*  final initializationMovies = <Movie>[
    .new(
      id: "a",
      title: "Movie A",
      coverUrl: null,
      bannerUrl: null,
      description: "Description A",
      director: "Director A",
      producer: "Producer A",
      releaseDate: "2023-01-01",
    ),
    .new(
      id: "b",
      title: "Movie B: The Adventure",
      coverUrl: null,
      bannerUrl: null,
      description: "Description B",
      director: "Director B",
      producer: "Producer B",
      releaseDate: "2023-02-01",
    ),
    .new(
      id: "c",
      title: "Movie C: The Adventure Continues",
      coverUrl: null,
      bannerUrl: null,
      description: "Description C",
      director: "Director C",
      producer: "Producer C",
      releaseDate: "2023-03-01",
    ),
  ];

  late final MovieRepository _repository;

  setUpAll(() {
    _repository = MovieRepository(movies: initializationMovies);
  });

  test('add a movie', () {
    _repository.add(Movie(id: "test movie", title: "test movie title"));

    expect(
      initializationMovies
          .where((element) => element.id == "test movie")
          .length,
      equals(1),
    );
  });

  test('fetch returns the right movie', () {
    expect(_repository.fetch("a"), equals(initializationMovies[0]));
  });

  test('fetchAll returns the entire list of movies', () {
    expect(_repository.fetchAll(), equals(initializationMovies));
  });

  test(
    'search returns all movies that that contains the given input in lowercase',
    () {
      final expectedMovies = initializationMovies
          .map((movie) => movie)
          .toList()
          .sublist(1, 3);

      final result = _repository.search("The Adventure");

      expect(result, equals(expectedMovies));
      expect(result.length, equals(expectedMovies.length));
    },
  ); */
}
