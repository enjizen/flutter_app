import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var ctrlUsername = TextEditingController();
  var ctrlPassword = TextEditingController();

  void doLogin() {
    print("username = " + ctrlUsername.text);
    print("password = " + ctrlPassword.text);

    if (ctrlUsername.text == 'admin' && ctrlPassword.text == 'admin') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
/*
  Future<Null> doLogin() async {
    final response =
        await http.post("http://192.168.1.36:3000/login"
        , body: {"username" : ctrlUsername.text, "password" : ctrlPassword.text});

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } else {}
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.blue[100],
          ),
          ListView(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 80.0,
                    ),
                    Image(
                      image: AssetImage('assets/images/login_circle.png'),
                      width: 150,
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(54.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: ctrlUsername,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.email),
                                labelText: 'อีเมล์',
                                labelStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: ctrlPassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                  filled: true,
                                  prefixIcon: Icon(Icons.vpn_key),
                                  fillColor: Colors.white,
                                  labelText: "รหัสผ่าน",
                                  labelStyle: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              shadowColor: Colors.pink[500],
                              elevation: 5.0,
                              child: MaterialButton(
                                minWidth: 290,
                                height: 55,
                                color: Colors.pinkAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  'ลงชื่อเข้าใช้',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.3),
                                ),
                                onPressed: () => doLogin(),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'สมัครสมาชิก',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
