import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/local/genre_database.dart';
import '../../models/anime.dart';

class NewAnimeDetailsPage extends StatelessWidget {
  const NewAnimeDetailsPage({super.key, required this.anime});
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () async {
              saveDogs();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  CupertinoIcons.heart,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                CupertinoIcons.back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Hero(
            tag: anime.id,
            child: Image.network(
              width: width,
              height: height,
              anime.image,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.8),
                    Colors.black
                  ])),
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: height,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                      ],
                    ),
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
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
