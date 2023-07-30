import 'package:flutter/material.dart';
import '../../data/remote/fetch_animes.dart';
import 'components/anime_grid_view.dart';

class AnimePage extends StatelessWidget {
  const AnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: fetchAnimes(),
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
              return AnimeGridView(animes: itemList);
            default:
              return const Center(child: Text("Default"));
          }
        },
      ),
    );
  }
}
