import 'package:flutter/material.dart';
import 'package:movie_catalog/movie/components/card.dart';
import 'package:movie_catalog/movie/page/details.dart';

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
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 280,
            child: ListView.separated(
              itemCount: 10,
              clipBehavior: Clip.none,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16,
              ).copyWith(bottom: 16),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 16);
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    final value = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MovieDetailsPage();
                        },
                      ),
                    );

                    print(value);
                  },
                  child: MovieCard(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
