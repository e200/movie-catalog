import 'package:flutter/material.dart';
import 'package:movie_catalog/movie/page/catalog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        /* colorScheme: ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.black,
        ), */
      ),
      home: MovieCatalogPage(),
    );
  }
}
