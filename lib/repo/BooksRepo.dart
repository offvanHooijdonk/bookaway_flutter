import 'package:bookaway_flutter/dao/BookDao.dart';
import 'package:bookaway_flutter/model/BookModel.dart';

class BooksRepo {
  BooksRepo(this._dao);

  BookDao _dao;

  Future<List<BookModel>> getAll() {
    return _dao.listAll();
  }

  Future<BookModel> findById(int id) {
    return _dao.getById(id);
  }
}
