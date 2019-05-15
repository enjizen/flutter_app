import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserSScreen extends StatefulWidget {
  @override
  _UserSScreenState createState() => _UserSScreenState();
}

class _UserSScreenState extends State<UserSScreen> {
  var users;
  var isLoading = true;

  Future<Null> getUsers() async {
    final response = await http.get("https://randomuser.me/api/?results=20");

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      setState(() {
        isLoading = false;
        users = jsonResponse['results'];
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();

    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: Card(
        child: RefreshIndicator(
          onRefresh: getUsers,
          child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemBuilder: (context, int index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            onTap: () {},
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  '${users[index]['picture']['medium']}'),
                            ),
                            title: Text(
                              '${users[index]['name']['first']} ${users[index]['name']['last']}',
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text('${users[index]['email']}'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                          Divider(),
                        ],
                      );
                    },
                    itemCount: users != null ? users.length : 0,
                  ),
          ),
        ),
      ),
    );
  }
}
