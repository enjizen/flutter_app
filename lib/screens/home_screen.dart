import 'dart:io';

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
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () => Navigator.of(context).pushNamed('/photo'),
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () => Navigator.of(context).pushNamed('/add'),
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

    var drawer = Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the Drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'WY',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'PA',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
            currentAccountPicture: CircleAvatar(
              // NetworkImage('https://randomuser.me/api/portraits/med/men/87.jpg')
              backgroundImage: AssetImage('assets/images/20.jpg'),
            ),
            accountName: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Text(
                'Wanchalerm Yuphasuk',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            accountEmail: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text('wanchalerm.yuphasuk@outlook.com',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('หน้าหลัก'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('ข้อมูลผู้ใช้'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/users');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('ตั้งค่า'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('ออกจากแอพลิเคชัน'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: pages[currentIndex],
      drawer: drawer,
      floatingActionButton: floatingAction,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
