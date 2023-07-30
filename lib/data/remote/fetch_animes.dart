import 'dart:convert';

import 'package:cafeburp/models/anime.dart';
import 'package:cafeburp/models/anime_list.dart';
import 'package:cafeburp/models/genre.dart';
import 'package:http/http.dart' as http;
import '../../models/anime_meta.dart';
import 'constants.dart';

Future<List<Genre>> fetchGenres() async {
  /* return const [
    Genre(id: "Action", name: "Action"),
    Genre(id: "Drama", name: "Drama"),
    Genre(id: "Sci-fi", name: "Sci-fi"),
    Genre(id: "Shonen", name: "Shonen")
  ];*/
  var url = Uri.https(baseUrl, '/genre');
  final response = await http.get(url, headers: header);
  if (response.statusCode == 200) {
    var map = {"data": jsonDecode(response.body)};
    List<Genre> genres =
        (map['data'] as List).map((data) => Genre.fromJson(data)).toList();
    return genres;
  } else {
    switch (response.statusCode) {
      case 429:
        throw Exception('Too many requests');
      case 404:
        throw Exception('Page not found');
      case 403:
        throw Exception('Unauthorized access');
      default:
        throw Exception('Failed to load');
    }
  }
}

Future<AnimeList> fetchAnimes({String? search, String? genre}) async {
  //return Dummy.getAnimeList();
  const Map<String, String> queries = {
    "page": "1",
    "size": size,
    "sortOrder": "asc",
    "sortBy": "ranking"
  };

  if (search != null && search.isNotEmpty) queries["search"] = search;
  if (genre != null && genre.isNotEmpty) queries["genres"] = genre;

  var url = Uri.https(baseUrl, '/anime', queries);

  final response = await http.get(url, headers: header);

  if (response.statusCode == 200) {
    Map<String, dynamic> map = jsonDecode(response.body);
    List<Anime> animes =
        (map['data'] as List).map((data) => Anime.fromJson(data)).toList();
    Meta meta = Meta.fromJson(map['meta']);

    return AnimeList(animes: animes, meta: meta);
  } else {
    //return Dummy.getAnimeList();
    switch (response.statusCode) {
      case 429:
        throw Exception('Too many requests');
      case 404:
        throw Exception('Page not found');
      case 403:
        throw Exception('Unauthorized access');
      default:
        throw Exception('Failed to load');
    }
  }
}
