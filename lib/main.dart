import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/movie/page/catalog.dart';
import 'package:movie_catalog/movie/providers/current_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(child: const App()));
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
            colorScheme: ref.watch(currentThemeProvider)
                ? ColorScheme.light()
                : ColorScheme.dark(),
          ),
          home: MovieCatalogPage(),
        );
      },
    );
  }
}
