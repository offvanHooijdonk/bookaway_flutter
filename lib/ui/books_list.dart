import 'package:bookaway_flutter/model/BookModel.dart';
import 'package:bookaway_flutter/model/UserModel.dart';
import 'package:bookaway_flutter/navigation/Navigator.dart';
import 'package:bookaway_flutter/repo/BooksRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin_flutter/koin_flutter.dart';

List<UserModel> users = [
  UserModel(1, "yahor.fralou@itechart-group.com"),
  UserModel(2, "john.doe@itechart-group.com"),
];

class BooksListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BooksListScreenState();
  }
}

class _BooksListScreenState extends State<BooksListScreen> {
  @override
  Widget build(BuildContext context) {
    final repo = get<BooksRepo>();
    final books = repo.getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text("BookAway"),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          BookModel book = books[index];
          return Card(
              child: InkWell(
                  onTap: () => { Nav(context).navBookInfo(book.id) },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(children: [
                      Row(children: [
                        Text(
                          book.title,
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          (book.readerId != null) ? "assets/ic_marked.svg" : "assets/ic_unmarked.svg",
                          color: (book.readerId == Session().currentUser.id) ? Colors.orange : Colors.black,
                        ),
                      ]),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(getStatusTitle(
                            book.status,
                          )),
                          Spacer(),
                          Visibility(
                            visible: book.readerId != null,
                            child: Text("by ${getReaderName(findUser(book.readerId))}"),
                          )
                        ],
                      ),
                    ]),
                  )));
        },
      ),
    );
  }
}

UserModel findUser(int id) {
  return id != null ? users.firstWhere((el) => el.id == id, orElse: null) : null;
}

String getReaderName(UserModel user) {
  return user != null
      ? ((user == Session().currentUser) ? "you" : user.email.substring(0, user.email.indexOf("@")))
      : null;
}

Color getStatusColor(BookModel book) {
  return book.status == Status.AVAILABLE ? Colors.green : (book.status == Status.TAKEN ? Colors.orange : Colors.grey);
}

String getStatusTitle(Status status) {
  String result = "Unknown";
  switch (status) {
    case Status.AVAILABLE:
      result = "Available";
      break;
    case Status.TAKEN:
      result = "Taken";
      break;
  }
  return result;
}
