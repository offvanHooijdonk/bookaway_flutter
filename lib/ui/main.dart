import 'package:bookaway_flutter/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: LoginPage(title: 'Flutter Demo Home Page'),
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
                  onPressed: () => { Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainScreen(); // TODO make Main top nav screen
                  })) },
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
