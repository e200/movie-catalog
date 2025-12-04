import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/movie/repository.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepository();
});
