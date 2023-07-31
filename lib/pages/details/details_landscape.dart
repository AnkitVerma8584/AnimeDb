import 'package:flutter/material.dart';
import '../../models/anime.dart';

class DetailsPageLandscape extends StatelessWidget {
  const DetailsPageLandscape({super.key, required this.anime});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Hero(
            tag: anime.id,
            child: Image.network(
              width: double.infinity,
              height: double.infinity,
              anime.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(anime.status),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(anime.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 34, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: anime.genres
                          .map((e) => Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(e),
                              )))
                          .toList()),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Alternative Titles:"),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: anime.alternativeTitles
                                  .map((e) => Text(e))
                                  .toList())
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(anime.synopsis, textAlign: TextAlign.center),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
