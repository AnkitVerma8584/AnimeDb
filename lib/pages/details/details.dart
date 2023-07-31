import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/anime.dart';
import 'details_landscape.dart';
import 'details_portrait.dart';

class NewAnimeDetailsPage extends StatelessWidget {
  const NewAnimeDetailsPage({super.key, required this.anime});
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
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
      body: orientation == Orientation.portrait
          ? DetailsPagePortrait(anime: anime)
          : DetailsPageLandscape(anime: anime),
      extendBodyBehindAppBar: true,
    );
  }
}
