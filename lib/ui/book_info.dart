import 'package:bookaway_flutter/model/BookModel.dart';
import 'package:bookaway_flutter/model/UserModel.dart';
import 'package:bookaway_flutter/repo/BooksRepo.dart';
import 'package:bookaway_flutter/service/TakeBookService.dart';
import 'package:bookaway_flutter/ui/books_list.dart';
import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';

class BookInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookInfoState();
  }
}

class _BookInfoState extends State<BookInfoScreen> {
  BookModel _book;
  BooksRepo _repo;
  TakeBookService _service;

  bool isButtonEnabled() {
    return _book.status == Status.AVAILABLE ||
        (_book.status == Status.TAKEN && _book.readerId == Session().currentUser.id);
  }

  void onButtonClicked() async {
    var bookResult;
    if (_book.status == Status.TAKEN) {
      bookResult = await _service.returnBook(Session().currentUser.id, _book.id);
    } else {
      bookResult = await _service.takeBook(Session().currentUser.id, _book.id);
    }
    setState(() {
      _book = bookResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    _repo = get<BooksRepo>();
    _service = get<TakeBookService>();
    final bookId = ModalRoute
        .of(context)
        .settings
        .arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("Book"),
        ),
        body: FutureBuilder<BookModel>(
            future: _repo.findById(bookId),
            builder: (BuildContext context, AsyncSnapshot<BookModel> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                _book = snapshot.data;
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _book.title,
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Chip(
                            label: Text(getStatusTitle(
                              _book.status,
                            )),
                            backgroundColor: getStatusColor(_book),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Visibility(
                            visible: _book.readerId != null,
                            child: Text("by ${getReaderName(findUser(_book.readerId))}"),
                          ),
                        ],
                      ),
                      ButtonBar(
                        children: [
                          ElevatedButton(
                            child: Text((_book.status == Status.TAKEN && _book.readerId == Session().currentUser.id)
                                ? "Return"
                                : "Take"),
                            onPressed: isButtonEnabled() ? onButtonClicked : null,
                          )
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
