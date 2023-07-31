class AnimeQuery {
  final String searchText;
  final String selectedGenre;

  const AnimeQuery({required this.searchText, required this.selectedGenre});

  @override
  String toString() {
    return "{ search : $searchText  , genre : $selectedGenre }";
  }
}
