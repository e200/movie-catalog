import 'package:flutter/material.dart';
import 'package:movie_catalog/components/movie/card.dart';

class MovieList extends StatelessWidget {
  final String title;

  const MovieList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              Text(
                'View all',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        GestureDetector(onTap: () {}, child: MovieCard()),
      ],
    );
  }
}
