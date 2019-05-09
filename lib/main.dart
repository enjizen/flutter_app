import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomeScreen(),
      theme: ThemeData(fontFamily: 'EkkmaiStandard'),
    );
  }
}
