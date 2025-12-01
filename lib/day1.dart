import 'package:flutter/material.dart';

import 'globleVariable.dart';

class Day1 extends StatelessWidget {
  const Day1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){ variableType();}, child: Text('variableType')),
          ElevatedButton(onPressed: (){ loopType();}, child: Text('Loops')),
          ElevatedButton(onPressed: (){ nullSafety();}, child: Text('Null Safety')),
          ElevatedButton(onPressed: (){ stringInterpolation();}, child: Text('String Interpolation')),
        ],
      ),
    );
  }

}

void variableType(){
  int i = 10;
  double d = 5.7;
  String s = 'Ankur';
  bool b = true;
  printF('int: $i || double: $d || String: $s || bool $b');

  List<String> ls = ['a','b','c'];
  List<int> li = [1,2,3];
  printF('String List: $ls || Int list: $li');

  Map<String,dynamic> user = {'name':'Ankur','age': 27};
  List<Map<String,dynamic>> users = [{'name':'Ankur','age': 27},{'name':'N','age': 25}];
  printF('Map vale: $user || Map List: $users');

  dynamic x = 0;  //flexible type
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

  Set<int> si = {1,2,4,3,2,4,3,1,3,4,2,3,5};
  printF('Set<int> si : $si');
}

void loopType() {
  for (int x = 0; x < 5; x++) {
    printF("For loop item $x");
  }
  //this loop work until x < 5 no break point

  int y = 0;
  List<String> users = ['a','b','c','d','e'];
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

void nullSafety(){
  int? x; //declare null value
  printF('Null variable x = $x');
  int y = x ?? 10; //store null value in int if null than use pre-value because int var can't be null at run time
  printF('Null variable x = $x store in not null value Y : $y so it take pre value ');
  x ??= 10; //it's take pre value in null variable if it null at compile
  printF('set null variable pre-value: $x');
}

void stringInterpolation(){
  String name = 'Ankur';
  printF('Basic: Hello, $name');

  int a = 7; int b = 8;
  printF('Expression: a($a) & b($b) Tota: ${a+b}');

  String greet(String user)=> 'Hello, Welcome back ${user.toUpperCase()}';
  printF('Method: ${greet('Ankur')}');

  var user = {'name' : 'Ankur' , 'age' : 27};
  printF('User: ${user['name']} is ${user['age']} year old');
}



