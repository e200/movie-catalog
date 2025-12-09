import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/movie/view/page/catalog.dart';
import 'package:movie_catalog/movie/controllers/shared_preferences.dart';
import 'package:movie_catalog/movie/controllers/theme_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
            colorScheme: ref.watch(themeModeProvider)
                ? ColorScheme.light()
                : ColorScheme.dark(),
          ),
          home: MovieCatalogPage(),
        );
      },
    );
  }
}
