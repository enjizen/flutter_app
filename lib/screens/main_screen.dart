import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String firstName = "Wanchalerm";
  String lastName = "yuphasuk";
  String address = '''
  line 1
  line 2
  line 3
  ''';

  int age = 20;
  double weight = 60.0;
  double height = 160.0;

  bool isActive = true;
  bool isCancel = false;

  var description = "sssssssss";
  Map<String, int> m = {"a":2};
  List<Map<String, int>> myuser = [{'name':20, 'age':20}];

  void showName(String name, int age)
  {
    print("Name : $name, Age: $age");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Application!")),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          print('$firstName $lastName');
          print('${1 +1}');

        print("===========");

          double bmi = weight / ((height / 100) * (height / 100));
          print("BMI : $bmi");
          showName("wanchalerm", 31);

          Person person = Person("Hello flutter");
          person.showName();
        },
        color: Colors.pink,
        textColor: Colors.white,
        child: Text("คลิก!!"),
      )),
    );
  }
}

class Person {
  String name;
  int age;

  Person(this.name);

  showName(){
     print("class, name: $name");
  }
}
