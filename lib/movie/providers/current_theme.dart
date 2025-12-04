import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/main.dart';

final currentThemeProvider = StateNotifierProvider<ThemeProvider, bool>((ref) {
  return ThemeProvider(sharedPreferences.getBool('theme_mode') ?? true);
});

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider(super.state);

  void toggleTheme() {
    state = !state;

    sharedPreferences.setBool('theme_mode', state);
  }
}
