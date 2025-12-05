import 'package:movie_catalog/movie/controllers/shared_preferences.dart';
import 'package:riverpod/riverpod.dart';

final bannedMovieProvider = StateProvider((ref) {
  return ref.read(sharedPreferencesProvider).getStringList('banned_movies') ??
      <String>[];
});
