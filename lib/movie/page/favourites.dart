import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_catalog/movie/components/card.dart';
import 'package:movie_catalog/movie/model.dart';
import 'package:movie_catalog/movie/providers/favourite_movies.dart';

class FavouriteMoviesPage extends StatelessWidget {
  const FavouriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourites')),
      body: Consumer(
        builder: (context, ref, child) {
          final movies = ref.watch(favouriteMoviesProvider);

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return ListTile(
                leading: CachedNetworkImage(imageUrl: movie.coverUrl!),
                title: Text(movie.title),
                subtitle: Text(
                  movie.description!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
