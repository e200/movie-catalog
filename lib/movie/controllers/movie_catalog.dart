import 'package:movie_catalog/movie/model/movie.dart';
import 'package:movie_catalog/movie/controllers/movie_repository.dart';
import 'package:movie_catalog/movie/repository.dart';
import 'package:riverpod/riverpod.dart';

class MovieCatalogController
    extends StateNotifier<AsyncValue<Map<String, List<Movie>>>> {
  static final provider = StateNotifierProvider((ref) {
    return MovieCatalogController(
      const AsyncValue.loading(),
      movieRepository: ref.read(movieRepositoryProvider),
    );
  });

  final MovieRepository movieRepository;

  MovieCatalogController(super.state, {required this.movieRepository});

  void fetchAllByCategory() async {
    state = const AsyncValue.loading();

    state = AsyncValue.data(await movieRepository.fetchAllByGenre());
  }
}
