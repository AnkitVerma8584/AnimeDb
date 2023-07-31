import 'package:cafeburp/models/anime_queries.dart';
import 'package:cafeburp/models/genre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/genre_repositroy.dart';
import 'anime_page.dart';
import 'home_header.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ValueNotifier<AnimeQuery> genreSelection = ValueNotifier<AnimeQuery>(
      const AnimeQuery(searchText: "", selectedGenre: ""));

  void genreSelected(String genre) {
    var oldSearch = genreSelection.value.searchText;
    genreSelection.value =
        AnimeQuery(searchText: oldSearch, selectedGenre: genre);
  }

  void searchMade(String search) {
    var oldGenre = genreSelection.value.selectedGenre;
    genreSelection.value =
        AnimeQuery(searchText: search, selectedGenre: oldGenre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const HomePageHeader(),
            const SizedBox(height: 16),
            AnimeSearchBar(searchText: searchMade),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            GenreTabBar(
              genreSelected: genreSelected,
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<AnimeQuery>(
                valueListenable: genreSelection,
                builder: ((context, value, child) => AnimePage(query: value))),
          ]),
        ),
      ),
    );
  }
}

class AnimeSearchBar extends StatelessWidget {
  AnimeSearchBar({super.key, required this.searchText});
  final controller = TextEditingController();
  final void Function(String search) searchText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  textInputAction: TextInputAction.search,
                  onChanged: (value) => {if (value.isEmpty) searchText(value)},
                  onSubmitted: (value) => searchText(value),
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      size: 20,
                    ),
                    hintText: "Search for any anime",
                  )),
            ),
            ElevatedButton(
                onPressed: () => searchText(controller.text),
                child: const Text("Search"))
          ],
        ),
      ),
    );
  }
}

class GenreTabBar extends StatelessWidget {
  const GenreTabBar({super.key, required this.genreSelected});
  final void Function(String genre) genreSelected;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllGenres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var genres = snapshot.data!;
            genres.insert(0, const Genre(id: "", name: "Top Animes"));
            return GenreTabView(genres: genres, genreSelected: genreSelected);
          }
          return const SizedBox(
            height: 30,
          );
        });
  }
}

class GenreTabView extends StatefulWidget {
  const GenreTabView(
      {super.key, required this.genres, required this.genreSelected});
  final List<Genre> genres;
  final void Function(String genre) genreSelected;
  @override
  State<GenreTabView> createState() => _GenreTabViewState();
}

class _GenreTabViewState extends State<GenreTabView> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: widget.genres.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => {
              if (tabIndex != index)
                setState(() {
                  widget.genreSelected(widget.genres[index].id);
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
