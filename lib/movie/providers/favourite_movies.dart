import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/movie/model.dart';

final favouriteMoviesProvider = StateProvider((ref) {
  return <Movie>[];
});
