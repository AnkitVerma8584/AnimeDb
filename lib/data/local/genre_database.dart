import 'dart:async';
import 'package:cafeburp/models/genre.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GenreDatabaseHelper {
  static Future<Database> _getDb() async {
    return openDatabase(
      join(await getDatabasesPath(), 'genre_database.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE genre(id TEXT PRIMARY KEY, name TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insertGenre(List<Genre> genre) async {
    final db = await _getDb();
    for (final g in genre) {
      await db.insert(
        'genre',
        g.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  static Future<List<Genre>> genres() async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query('genre');
    return List.generate(maps.length, (i) {
      return Genre(id: maps[i]['id'], name: maps[i]['name']);
    });
  }
}
