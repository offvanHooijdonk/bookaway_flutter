import 'file:///D:/WORK/Android/Projects/bookaway_flutter/lib/ui/books_list.dart';
import 'package:bookaway_flutter/model/BookModel.dart';
import 'package:bookaway_flutter/model/UserModel.dart';
import 'package:flutter/material.dart';

class BookInfoScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BookInfoState();
  }
}

class _BookInfoState extends State<BookInfoScreen> {
  BookModel book;

  bool isButtonEnabled() {
    return book.status == Status.AVAILABLE || (book.status == Status.TAKEN && book.readerId == Session().currentUser.id);
  }

  void onButtonClicked() {}

  @override
  Widget build(BuildContext context) {
    book = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("Book"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16,),
              Row(children: [
                Chip(
                  label: Text(getStatusTitle(
                    book.status,
                  )),
                  backgroundColor: getStatusColor(book),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Spacer(),
                Visibility(
                  visible: book.readerId != null,
                  child: Text("by ${getReaderName(findUser(book.readerId))}"),
                ),
              ],),
              ButtonBar(
                children: [
                  ElevatedButton(
                    child: Text(
                        (book.status == Status.TAKEN && book.readerId == Session().currentUser.id) ? "Return" : "Take"),
                    onPressed: isButtonEnabled() ? onButtonClicked : null,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
