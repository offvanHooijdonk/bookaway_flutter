import 'package:bookaway_flutter/model/BookModel.dart';
import 'package:bookaway_flutter/ui/book_info.dart';
import 'package:bookaway_flutter/ui/main.dart';
import 'package:bookaway_flutter/ui/books_list.dart';
import 'package:flutter/material.dart';

class Nav {
  static const String LOGIN = "login";
  static const String BOOKS_LIST = "books_list";
  static const String BOOK_INFO = "book_info";

  static final Nav _navigator = Nav._internal();

  BuildContext _context;

  Map<String, WidgetBuilder> routes = {
    LOGIN: (context) => LoginPage(title: 'Flutter Demo Home Page'),
    BOOKS_LIST: (context) => BooksListScreen(),
    BOOK_INFO: (context) => BookInfoScreen(),
  };

  factory Nav(BuildContext context) {
    _navigator._context = context;
    return _navigator;
  }

  Nav._internal();

  void navBooksList() {
    Navigator.pushReplacementNamed(_context, BOOKS_LIST);
  }

  void navBookInfo(BookModel bookModel) {
    Navigator.pushNamed(_context, BOOK_INFO, arguments: bookModel);
  }
}