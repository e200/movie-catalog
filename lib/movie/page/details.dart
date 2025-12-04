import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, 'a');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.network(
                fit: BoxFit.cover,
                'https://lumiere-a.akamaihd.net/v1/images/image_e4f7582e.jpeg?region=0,0,540,810',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                runSpacing: 12,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Titulo'), Text('Subtitulo')],
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
                  Text(
                    'Enim Lorem dolore dolore ipsum non. Lorem excepteur tempor ullamco incididunt quis minim dolor nulla excepteur id sint deserunt occaecat. Do ipsum fugiat officia ex eu. Quis ad sunt elit et nulla.\nNon do exercitation dolore sint velit proident dolor commodo fugiat mollit. Ut id anim cupidatat et nostrud magna occaecat quis incididunt commodo duis ex. Nostrud ut voluptate cillum labore aute fugiat sit ex quis velit. Excepteur proident ut nostrud aute elit tempor do reprehenderit dolore reprehenderit occaecat. Enim magna mollit ut nisi voluptate magna in consequat.\nElit adipisicing non voluptate in tempor aute aliqua ea officia quis aliquip. Velit amet est ut esse reprehenderit ex elit adipisicing sint eiusmod. Sunt laborum aute eu occaecat commodo reprehenderit culpa ea in Lorem eu laborum laboris veniam. Pariatur minim ad dolor consequat dolor. Ullamco nisi consectetur commodo non anim minim labore incididunt eiusmod proident. Ipsum qui aliqua ut est. Nostrud enim et in exercitation duis laborum duis est ex elit non nulla id.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
