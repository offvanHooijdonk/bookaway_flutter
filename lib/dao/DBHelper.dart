import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> _db;

  Future<Database> getDatabase() async {
    if (_db == null) {
      _db = _initDB();
    }
    return _db;
  }

  Future<Database> _initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(join(await getDatabasesPath(), 'bookaway.db'), onCreate: (Database db, int version) async {
      db.execute("""
        CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT NOT NULL
        );
        
        CREATE TABLE books (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          createsAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
          updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
          deadLine DATETIME NOT NULL,
          ownerId INTEGER NOT NULL,
          status INTEGER NOT NULL,
          readerId INTEGER
        );
        
        INSERT INTO users(1, email) VALUES (\"yahor.fralou@itechart-group.com\");
        INSERT INTO users(2, email) VALUES (\"john.doe@itechart-group.com\");
        INSERT INTO users(3, email) VALUES (\"rosamund.pike@itechart-group.com\");
        INSERT INTO users(4, email) VALUES (\"ellen.ripley@itechart-group.com\");
        
        INSERT INTO books(title, deadLine, ownerId, status, readerId) VALUES("Don Quixote", null, 1, "AVAILABLE", null);
        INSERT INTO books(title, deadLine, ownerId, status, readerId) VALUES("Пикник на обочине", null, 3, "AVAILABLE", null);
        INSERT INTO books(title, deadLine, ownerId, status, readerId) VALUES("Jo Nesbø - Snowman", '2021-03-25 18:00:00', 1, "TAKEN", 2);
        INSERT INTO books(title, deadLine, ownerId, status, readerId) VALUES("Tom Sawyer", null, 4, "AVAILABLE", null);
        INSERT INTO books(title, deadLine, ownerId, status, readerId) VALUES("Peter Watts - Blindsight", null, 1, "AVAILABLE", null);
        INSERT INTO books(title, deadLine, ownerId, status, readerId) VALUES("Kotlin in Action", '2021-02-11 18:00:00', 2, "TAKEN", 1);
        INSERT INTO books(title, deadLine, ownerId, status, readerId) VALUES("Financial Intelligence", null, 2, "AVAILABLE", null);
        INSERT INTO books(title, deadLine, ownerId, status, readerId) VALUES("Headfirst Android Development", null, 3, "AVAILABLE", null);
        """);
    });
  }
}
