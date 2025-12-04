import 'package:flutter/material.dart';
import 'package:movie_catalog/movie/model.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.network(
                fit: BoxFit.cover,
                movie.coverUrl!,
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
