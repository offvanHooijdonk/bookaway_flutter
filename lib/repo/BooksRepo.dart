import 'package:bookaway_flutter/model/BookModel.dart';

class BooksRepo {
  List<BookModel> _books = [
    BookModel(1, "Don Quixote", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), 1, Status.AVAILABLE, null),
    BookModel(2, "Пикник на обочине", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), 1, Status.AVAILABLE, null),
    BookModel(3, "Jo Nesbø - Snowman", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), null, Status.TAKEN, 1),
    BookModel(4, "Tom Sawyer", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), null, Status.AVAILABLE, null),
    BookModel(5, "Peter Watts - Blindsight", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), null, Status.TAKEN, 2),
    BookModel(6, "Kotlin in Action", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), 1, Status.AVAILABLE, null),
    BookModel(
        7, "Financial Intelligence", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), 1, Status.AVAILABLE, null),
    BookModel(
        8, "The One Minute Manager", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), null, Status.AVAILABLE, null),
    BookModel(9, "Headfirst Android Development", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), null,
        Status.AVAILABLE, null),
  ];

  List<BookModel> getAll() {
    return _books;
  }

  BookModel findById(int id) {
    return _books.firstWhere((el) => el.id == id, orElse: null);
  }
}
