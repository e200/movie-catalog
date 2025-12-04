import 'package:flutter/material.dart';
import 'package:movie_catalog/components/movie/list.dart';

void main() {
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
      home: Scaffold(
        appBar: AppBar(title: const Text('Movie Catalog')),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Wrap(
              runSpacing: 15,
              children: [
                MovieList(title: 'Most tranding'),
                MovieList(title: 'Best Choices'),
                MovieList(title: 'Billionaire Romance'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
