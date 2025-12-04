
import 'package:flutter/material.dart';
import 'package:movie_catalog/movie/components/list.dart';

class MovieCatalogPage extends StatelessWidget {
  const MovieCatalogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
