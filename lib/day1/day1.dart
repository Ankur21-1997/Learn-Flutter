import 'package:flutter/material.dart';
import 'package:practice/day1/day1_practical2.dart';

import '../globleVariable.dart';
import 'day1_practical1.dart';

class Day1 extends StatelessWidget {
  const Day1({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> numList = [];
    final listController = TextEditingController();
    final numController = TextEditingController();
    final stringController = TextEditingController();
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final MapPerson mapPerson = MapPerson();

    return Scaffold(
      body: Column(
        children: [
          Text('Git Connected Code'),
          ElevatedButton(onPressed: () {
            variableType();
          }, child: Text('variableType')),
          ElevatedButton(onPressed: () {
            loopType();
          }, child: Text('Loops')),
          ElevatedButton(onPressed: () {
            nullSafety();
          }, child: Text('Null Safety')),
          ElevatedButton(onPressed: () {
            stringInterpolation();
          }, child: Text('String Interpolation')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50, child: TextField(controller: listController,)),
              ElevatedButton(onPressed: () {
                numList.add(int.tryParse(listController.text) ?? 0);
                listController.clear();
              }, child: Text('Add')),
              ElevatedButton(onPressed: () {
                numList = [];
              }, child: Text('Clear')),
            ],
          ),
          ElevatedButton(onPressed: () {
            day1Practical1(numList);
          }, child: Text('Practical 1')),
          ElevatedButton(onPressed: () {
            day1Practical2(numList);
          }, child: Text('Practical 2')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50, child: TextField(controller: numController,)),
              ElevatedButton(onPressed: () {
                int? square = squareNumber(int.tryParse(numController.text) ?? 0);
                printF('${numController.text} square $square');
              }, child: Text('Square')),
            ],
          ),
          ElevatedButton(onPressed: () {
            sumList();
          }, child: Text('Sum List')),
          ElevatedButton(onPressed: () {
            evenList();
          }, child: Text('Even Number')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50, child: TextField(controller: stringController,)),
              ElevatedButton(onPressed: () {
                countVowel(stringController.text);
              }, child: Text('Count Vowel')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50, child: TextField(controller: nameController,)),
              SizedBox(width: 50, child: TextField(controller: ageController,)),
              ElevatedButton(onPressed: () {
                mapPerson.savePerson(nameController.text,ageController.text);
                nameController.text = ageController.text = '';
              }, child: Text('Save Person')),
            ],
          ),
          ElevatedButton(onPressed: () {
            mapPerson.showPerson();
          }, child: Text('Show Person')),
          ElevatedButton(onPressed: () {
            mapPerson.youngestPerson();
          }, child: Text('Youngest Person')),
        ],
      ),
    );
  }

}

void variableType() {
  int i = 10;
  double d = 5.7;
  String s = 'Ankur';
  bool b = true;
  printF('int: $i || double: $d || String: $s || bool $b');

  List<String> ls = ['a', 'b', 'c'];
  List<int> li = [1, 2, 3];
  printF('String List: $ls || Int list: $li');

  Map<String, dynamic> user = {'name': 'Ankur', 'age': 27};
  List<Map<String, dynamic>> users = [{'name': 'Ankur', 'age': 27}, {'name': 'N', 'age': 25}];
  printF('Map vale: $user || Map List: $users');

  dynamic x = 0; //flexible type
  printF('Dynamic variable first assign: $x');
  x = 'String';
  printF('Dynamic variable second assign: $x');
  x = 10;
  printF('Dynamic variable third assign: $x');

  var xi = 10;
  var xs = 'Ankur';
  printF('var int type: $xi || var string type: $xs');
  // xv= 'String'; it's give error bcz once var type set it cant be change

  const pi = 3.14;
  final today = DateTime.now();
  printF('const pi : $pi || final today : $today');

  Set<int> si = {1, 2, 4, 3, 2, 4, 3, 1, 3, 4, 2, 3, 5};
  printF('Set<int> si : $si');
}

void loopType() {
  for (int x = 0; x < 5; x++) {
    printF("For loop item $x");
  }
  //this loop work until x < 5 no break point

  int y = 0;
  List<String> users = ['a', 'b', 'c', 'd', 'e'];
  while (users[y] != 'c') {
    printF("While loop item $y & ${users[y]}");
    y++;
  }
  //this loop stop on 3 time because its fill full condition

  int z = 7;
  do {
    printF("Do-While loop item $z");
    z++;
  } while (z < 5);
  //this work atlas once no matter 1st value is out of range
}

void nullSafety() {
  int? x; //declare null value
  printF('Null variable x = $x');
  int y = x ?? 10; //store null value in int if null than use pre-value because int var can't be null at run time
  printF('Null variable x = $x store in not null value Y : $y so it take pre value ');
  x ??= 10; //it's take pre value in null variable if it null at compile
  printF('set null variable pre-value: $x');
}

void stringInterpolation() {
  String name = 'Ankur';
  printF('Basic: Hello, $name');

  int a = 7;
  int b = 8;
  printF('Expression: a($a) & b($b) Tota: ${a + b}');

  String greet(String user) => 'Hello, Welcome back ${user.toUpperCase()}';
  printF('Method: ${greet('Ankur')}');

  var user = {'name': 'Ankur', 'age': 27};
  printF('User: ${user['name']} is ${user['age']} year old');
}



