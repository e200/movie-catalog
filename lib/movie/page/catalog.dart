import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/movie/components/list.dart';
import 'package:movie_catalog/movie/model.dart';
import 'package:movie_catalog/movie/providers/movie_catalog.dart';
import 'package:movie_catalog/movie/providers/theme_mode.dart';
import 'package:movie_catalog/movie/repository.dart';

class MovieCatalogPage extends ConsumerStatefulWidget {
  const MovieCatalogPage({super.key});

  @override
  ConsumerState<MovieCatalogPage> createState() => _MovieCatalogPageState();
}

class _MovieCatalogPageState extends ConsumerState<MovieCatalogPage> {
  @override
  void initState() {
    /*  MovieRepository.repository.fetchAllByGenre().then((value) async {
      setState(() {
        moviesByGenre = value;
      });
    }); */

    ref.read(MovieCatalogNotifier.provider.notifier).fetchAllByCategory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(themeModeProvider.notifier).toggleTheme();
        },
        child: Icon(Icons.abc),
      ),
      appBar: AppBar(title: const Text('Movie Catalog')),
      body: Consumer(
        builder: (context, ref, _) {
          return ref
              .watch(MovieCatalogNotifier.provider)
              .when(
                data: (data) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Wrap(
                        runSpacing: 15,
                        children: data.keys.map((key) {
                          return MovieList(title: key, movies: data[key]!);
                        }).toList(),
                      ),
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
              );
        },
      ),
    );
  }
}
