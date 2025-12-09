import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/movie/model/movie.dart';

final favouriteMoviesProvider = StateProvider((ref) {
  return <Movie>[ ];
});
