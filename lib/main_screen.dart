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
                SvgPicture.asset("assets/ic_unmarked.svg"),
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
                    child: Text("by ${getNameFromEmail(findUser(books[index].readerId)?.email)}"),
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

String getNameFromEmail(String email) {
  return email != null ? email.substring(0, email.indexOf("@")) : null;
}