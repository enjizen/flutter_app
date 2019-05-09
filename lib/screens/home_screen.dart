import 'package:flutter/material.dart';
import 'package:flutter_app/screens/page1.dart';
import 'package:flutter_app/screens/page2.dart';
import 'package:flutter_app/screens/page3.dart';

import 'add_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List pages = [PageOne(), PageTwo(), PageThree()];

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text("Home"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: () {}),
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
        )
      ],
    );

    var floatingAction = FloatingActionButton(
      onPressed: () async {
        var response = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddScreen("Hello Flutter")));

        print(response);
      },
      child: Icon(Icons.add),
    );

    var bottomNavBar = BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text("หน้าหลัก")),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text("ข้อมูลส่วนตัว")),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text("อื่นๆ"))
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: pages[currentIndex],
      floatingActionButton: floatingAction,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
