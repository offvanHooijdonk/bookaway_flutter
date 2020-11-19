import 'package:bookaway_flutter/model/UserModel.dart';
import 'package:bookaway_flutter/repo/BooksRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<UserModel> users = [
  UserModel(1, "yahor.fralou@itechart-group.com"),
  UserModel(2, "john.doe@itechart-group.com"),
];

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BookAway"),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Container(
            padding: EdgeInsets.all(16),
            child: Column(children: [
              Row(children: [
                Text(
                  books[index].title,
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                SvgPicture.asset(
                  (books[index].readerId != null) ? "assets/ic_marked.svg" : "assets/ic_unmarked.svg",
                  color: (books[index].readerId == Session().currentUser.id) ? Colors.orange : Colors.black,
                ),
              ]),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(books[index].status),
                  Spacer(),
                  Visibility(
                    visible: books[index].readerId != null,
                    child: Text("by ${getReaderName(findUser(books[index].readerId))}"),
                  )
                ],
              ),
            ]),
          ));
        },
      ),
    );
  }
}

UserModel findUser(int id) {
  return id != null ?  users.firstWhere((el) => el.id == id, orElse: null) : null;
}

String getReaderName(UserModel user) {
  return user != null ? ((user == Session().currentUser) ? "you" : user.email.substring(0, user.email.indexOf("@"))) : null;
}
