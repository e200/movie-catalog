import 'package:flutter/material.dart';
import 'package:movie_catalog/movie/components/list.dart';
import 'package:movie_catalog/movie/model.dart';
import 'package:movie_catalog/movie/repository.dart';

class MovieCatalogPage extends StatefulWidget {
  const MovieCatalogPage({super.key});

  @override
  State<MovieCatalogPage> createState() => _MovieCatalogPageState();
}

class _MovieCatalogPageState extends State<MovieCatalogPage> {
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
