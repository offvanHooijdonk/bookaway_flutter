
import 'package:bookaway_flutter/model/BookModel.dart';
import 'package:bookaway_flutter/repo/BooksRepo.dart';
import 'package:bookaway_flutter/service/exceptions.dart';

class TakeBookService {
  TakeBookService(this._repo);

  final BooksRepo _repo;

  Future<BookModel> takeBook(int userId, int bookId) async {
    final book = await _repo.findById(bookId);
    if (book.status == Status.AVAILABLE) {
      book.status = Status.TAKEN;
      book.readerId = userId;
      _repo.update(book);
      return book;
    } else {
      throw TakeBookException(book.readerId, book.id);
    }
  }

  Future<BookModel> returnBook(int userId, int bookId) async {
    final book = await _repo.findById(bookId);
    if (book.status == Status.TAKEN && book.readerId == userId) {
      book.status = Status.AVAILABLE;
      book.readerId = null;
      _repo.update(book);
      return book;
    } else {
      throw ReturnBookException(userId, book.id);
    }
  }
}