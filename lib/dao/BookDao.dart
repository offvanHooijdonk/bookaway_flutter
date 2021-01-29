import 'dart:async';

import 'package:bookaway_flutter/model/BookModel.dart';
import 'package:sqflite/sqflite.dart';

class BookDao {
  BookDao(this._database);

  Future<Database> _database;

  void insert(BookModel book) async {
    final Database db = await _database;
    await db.insert("books", book.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void update(BookModel book) async {
    final Database db = await _database;
    book.updatedAt = DateTime.now();
    await db.update("books", book.toMap(), where: "id = ?", whereArgs: [book.id]);
  }

  Future<List<BookModel>> listAll() async {
    final result = await (await _database).query("books");
    return List.generate(result.length, (i) {
      return BookModel.fromMap(result[i]);
    });/*result.map((e) =>
      BookModel.fromMap(e)
    );*/
  }

  Future<BookModel> getById(int id) async {
    final result = await (await _database).query("books", where: "id = ?", whereArgs: [id]);
    return BookModel.fromMap(result.first);
  }
}