
class TakeBookException implements Exception {
  TakeBookException(this._readerId, this._bookId) {
    message = "Could not take a book $_bookId as it is already taken by $_readerId";
  }

  String message;
  int _readerId;
  int _bookId;
}

class ReturnBookException implements Exception {
  ReturnBookException(this._readerId, this._bookId) {
    message = "Could not return a book $_bookId of user $_readerId as the user does not possess it.";
  }

  String message;
  int _readerId;
  int _bookId;
}