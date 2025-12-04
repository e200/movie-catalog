import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/movie/components/list.dart';
import 'package:movie_catalog/movie/model.dart';
import 'package:movie_catalog/movie/providers/current_theme.dart';
import 'package:movie_catalog/movie/repository.dart';

class MovieCatalogPage extends ConsumerStatefulWidget {
  const MovieCatalogPage({super.key});

  @override
  ConsumerState<MovieCatalogPage> createState() => _MovieCatalogPageState();
}

class _MovieCatalogPageState extends ConsumerState<MovieCatalogPage> {
  Map<String, List<Movie>>? moviesByGenre;

  @override
  void initState() {
    MovieRepository.repository.fetchAllByGenre().then((value) async {
      setState(() {
        moviesByGenre = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(currentThemeProvider.notifier).toggleTheme();
        },
        child: Icon(Icons.abc),
      ),
      appBar: AppBar(title: const Text('Movie Catalog')),
      body: Builder(
        builder: (context) {
          if (moviesByGenre == null) {
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Wrap(
                runSpacing: 15,
                children: [
                  if (moviesByGenre != null)
                    ...moviesByGenre!.keys.map((key) {
                      return MovieList(
                        title: key,
                        movies: moviesByGenre![key]!,
                      );
                    }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
