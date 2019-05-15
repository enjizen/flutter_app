import 'package:flutter/material.dart';
import 'package:flutter_app/screens/add_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/page1.dart';
import 'package:flutter_app/screens/users_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: LoginScreen(),
      theme: ThemeData(fontFamily: 'EkkmaiStandard'),
      routes: <String, WidgetBuilder>{
        '/add': (BuildContext context) => AddScreen('Hello'),
        '/photo': (BuildContext context) => PageOne(),
        '/users': (BuildContext context) => UserSScreen(),
      },
    );
  }
}
