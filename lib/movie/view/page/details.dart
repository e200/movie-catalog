import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/movie/model/movie.dart';
import 'package:movie_catalog/movie/controllers/banned_movie.dart';
import 'package:movie_catalog/movie/controllers/shared_preferences.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              final bannedMoviesList = [
                ...ref.read(bannedMovieProvider),
                movie.id,
              ];

              ref
                  .read(sharedPreferencesProvider)
                  .setStringList('banned_movies', bannedMoviesList);

              ref.read(bannedMovieProvider.notifier).state = bannedMoviesList;

              /*  final movies = ref.read(favouriteMoviesProvider.notifier).state;
        
            if (movies.contains(movie)) {
              ref.read(favouriteMoviesProvider.notifier).state = [
                ...movies.where((element) => element.id != movie.id),
              ];
            } else {
              ref.read(favouriteMoviesProvider.notifier).state = [
                ...ref.read(favouriteMoviesProvider.notifier).state,
                movie,
              ];
            } */
            },
            child: Icon(Icons.favorite),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Hero(
                tag: movie.title,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: movie.coverUrl!,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                runSpacing: 12,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(movie.title), Text(movie.subititle!)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Summary'),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite),
                              SizedBox(width: 4),
                              Text('100'),
                            ],
                          ),
                          SizedBox(width: 12),
                          Row(
                            children: [
                              Icon(Icons.visibility),
                              SizedBox(width: 4),
                              Text('100'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(movie.description!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
