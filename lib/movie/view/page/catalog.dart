import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/movie/view/components/list.dart';
import 'package:movie_catalog/movie/controllers/movie_catalog.dart';
import 'package:movie_catalog/movie/controllers/theme_mode.dart';

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

    ref.read(MovieCatalogController.provider.notifier).fetchAllByCategory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [ListTile(title: Text('Favoutires'), onTap: () {})],
        ),
      ),
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
              .watch(MovieCatalogController.provider)
              .when(
                data: (data) {
                  final categoryNames = data.keys.toList();

                  return ListView.builder(
                    itemCount: categoryNames.length,
                    itemBuilder: (context, index) {
                      final categoryName = categoryNames[index];

                      return MovieList(
                        title: categoryName,
                        movies: data[categoryName]!
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              );
        },
      ),
    );
  }
}
