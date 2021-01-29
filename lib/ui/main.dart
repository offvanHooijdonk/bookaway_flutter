import 'package:bookaway_flutter/dao/daoModule.dart';
import 'package:bookaway_flutter/navigation/Navigator.dart';
import 'package:bookaway_flutter/repo/repoModule.dart';
import 'package:bookaway_flutter/service/serviceModule.dart';
import 'package:flutter/material.dart';
import 'package:koin/koin.dart';

void main() {
  startKoin((app){
    app.modules([serviceModule, repoModule, daoModule]);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        primaryColorDark: Colors.blue,
        accentColor: Colors.pinkAccent
      ),
      initialRoute: Nav.LOGIN,
      routes: Nav(context).routes,
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                TextField(decoration: InputDecoration(labelText: "Login"),),
                TextField(decoration: InputDecoration(labelText: "Password"),),
                ElevatedButton(
                  onPressed: () => { Nav(context).navBooksList() },
                  child: Text("Login"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
