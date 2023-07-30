import 'package:cafeburp/pages/home/components/anime_card.dart';
import 'package:cafeburp/models/anime_list.dart';
import 'package:cafeburp/pages/details/details.dart';
import 'package:flutter/material.dart';
import '../../../models/anime.dart';

class AnimeGridView extends StatelessWidget {
  const AnimeGridView({super.key, required this.animes});
  final AnimeList animes;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    int count = size ~/ 200;
    return GridView.builder(
        itemCount: animes.animes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0),
        itemBuilder: (context, index) {
          Anime anime = animes.animes[index];
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewAnimeDetailsPage(anime: anime)),
                );
              },
              child: AnimeCard(anime: anime));
        });
  }
}
