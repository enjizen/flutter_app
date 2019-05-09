import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  var params;

  AddScreen(this.params);

  @override
  _AddScreenState createState() => _AddScreenState(params);
}

class _AddScreenState extends State<AddScreen> {
  var params;

  _AddScreenState(this.params);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data Screen"),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            "Params: $params",
            style: TextStyle(fontSize: 20),
          ),
          Text("Add data"),
          RaisedButton(
            onPressed: () => Navigator.of(context).pop("Ok"),
            child: Text("Back"),
            color: Colors.pink,
          )
        ],
      ),
    );
  }
}
