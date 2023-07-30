import 'package:cafeburp/data/remote/fetch_animes.dart';
import 'package:flutter/foundation.dart';
import 'package:cafeburp/data/local/genre_database.dart';
import '../models/genre.dart';

Future<List<Genre>> getAllGenres() async {
  if (!(defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS)) {
    return await fetchGenres();
  }

  var list = await GenreDatabaseHelper.genres();
  if (list.isEmpty) {
    var remoteList = await fetchGenres();
    await GenreDatabaseHelper.insertGenre(remoteList);
    return remoteList;
  }
  return list;
}
