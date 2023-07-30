import 'package:cafeburp/models/anime.dart';
import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({super.key, required this.anime});
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(children: [
        AspectRatio(
          aspectRatio: 2 / 3,
          child: Hero(
              tag: anime.id,
              child: Image.network(
                anime.image,
                fit: BoxFit.cover,
              )),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black12, Colors.black])),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              anime.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}
