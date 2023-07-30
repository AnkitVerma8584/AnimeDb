import 'package:cafeburp/models/genre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/genre_repositroy.dart';
import 'anime_page.dart';
import 'home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            HomePageHeader(),
            SizedBox(height: 16),
            AnimeSearchBar(),
            SizedBox(height: 16),
            GenreTabBar(),
            SizedBox(height: 16),
            AnimePage()
          ]),
        ),
      ),
    );
  }
}

class AnimeSearchBar extends StatelessWidget {
  const AnimeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) => {},
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          gapPadding: 6,
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: const Icon(
          CupertinoIcons.search,
          size: 20,
        ),
        hintText: "Search for any anime",
      ),
    );
  }
}

class GenreTabBar extends StatelessWidget {
  const GenreTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllGenres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var genres = snapshot.data!;
            genres.insert(0, const Genre(id: "", name: "Top Animes"));
            return GenreTabView(genres: genres);
          }
          return const SizedBox(
            height: 30,
          );
        });
  }
}

class GenreTabView extends StatefulWidget {
  const GenreTabView({super.key, required this.genres});
  final List<Genre> genres;
  @override
  State<GenreTabView> createState() => _GenreTabViewState();
}

class _GenreTabViewState extends State<GenreTabView> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        itemCount: widget.genres.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => {
              if (tabIndex != index)
                setState(() {
                  tabIndex = index;
                })
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.genres[index].name,
                style: TextStyle(
                    fontWeight:
                        index == tabIndex ? FontWeight.bold : FontWeight.normal,
                    color: index == tabIndex ? Colors.white : Colors.white38,
                    fontSize: 15),
              ),
            ),
          );
        },
      ),
    );
  }
}
