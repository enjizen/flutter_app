import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.fitWidth,
            ),
            Container(
              height: 100.0,
              color: Colors.red,
            ),
            Container(
              height: 100.0,
              color: Colors.green,
            ),
            Container(
              height: 100.0,
              color: Colors.blue,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 100.0,
                    color: Colors.pink,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    color: Colors.amber,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 100.0,
                    color: Colors.deepPurple,
                  ),
                ),
                Expanded(
                  child: Image(
                    height: 100,
                    image: AssetImage("assets/images/bg.png"),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    color: Colors.blueAccent,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
