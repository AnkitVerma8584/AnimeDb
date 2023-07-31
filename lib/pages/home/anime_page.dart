import 'package:cafeburp/models/anime_queries.dart';
import 'package:flutter/material.dart';
import '../../data/remote/fetch_animes.dart';
import 'components/anime_grid_view.dart';

class AnimePage extends StatelessWidget {
  const AnimePage({super.key, required this.query});
  final AnimeQuery query;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future:
            fetchAnimes(genre: query.selectedGenre, search: query.searchText),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator.adaptive());
            case ConnectionState.done:
              if (!snapshot.hasData) {
                final String error = snapshot.error.toString().substring(11);
                return Center(child: Text(error));
              }
              var itemList = snapshot.data!;
              if (itemList.animes.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("No Results found"),
                );
              }
              return AnimeGridView(animes: itemList);
            default:
              return const Center(child: Text("Default"));
          }
        },
      ),
    );
  }
}
