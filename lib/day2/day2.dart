import 'package:flutter/material.dart';
import 'package:practice/day2/day2_practical1.dart';
import 'package:practice/globleVariable.dart';

class Day2 extends StatelessWidget {
  const Day2({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Text('Day 2 : Advanced Dart (OOP)'),
          ElevatedButton(onPressed: () {
            Animal dog = AnimalFactory.create('dog', 'tommy', 3);
            Animal cat = AnimalFactory.create('cat', 'tin', 2);
            dog.info();
            dog.speak();
            cat.info();
            cat.speak();
          }, child: Text('Animal')),
          ElevatedButton(onPressed: () {
            printF(B().greet());
          }, child: Text('Overriding Method')),
          ElevatedButton(onPressed: () {
            var s1 = Student('Rahul', 10);
            s1.printInfo();
            var s2 = Student.details();
            s2.printInfo();
          }, child: Text('Practical 1')),
          ElevatedButton(onPressed: () {
            var c = Circle(4.5);
            c.printArea();
          }, child: Text('Circle Area')),
          ElevatedButton(onPressed: () {
            var r = Rectangle(4,5);
            r.printArea();
          }, child: Text('Rectangle Area')),
          ElevatedButton(onPressed: () {
            final jsonData = [
              {
                'id': 1,
                'name': 'Laptop',
                'price': 49999.0,
              },
              {
                'id': 2,
                'name': 'Mobile',
                'price': 19999.0,
              },
              {
                'id': 3,
                'name': 'TV',
                'price': 29999.0,
              },
            ];

            final products = parseProducts(jsonData);

            for (var p in products) {
              printF("${p.id} → ${p.name} → ₹${p.price}");
            }
          }, child: Text('Factory constructor')),
          // ElevatedButton(onPressed: () {
          //   nullSafety();
          // }, child: Text('Null Safety')),
        ],
      ),
    );
  }
}

///--- Example for Classes ( Abstract, Inheritance, Factory, default)
// Abstract class = cannot create object directly
abstract class Animal {
  final String name;
  final int age;

  Animal(this.name, this.age);

  // Abstract method → must be implemented by child classes
  void speak();

  // Regular method shared by all
  void info() {
    print("$name is $age years old.");
  }
}
class Dog extends Animal {
  // Normal constructor
  Dog(String name, int age) : super(name, age);

  @override
  void speak() => print("$name says: Woof!");
}
class Cat extends Animal {
  Cat(String name, int age) : super(name, age);

  @override
  void speak() => print("$name says: Meow!");
}
class AnimalFactory {
  static Animal create(String type, String name, int age) {
    switch (type.toLowerCase()) {
      case 'dog':
        return Dog(name, age);
      case 'cat':
        return Cat(name, age);
      default:
        throw Exception('Unknown animal type');
    }
  }
}

///--- Overriding Method
class A {
  String greet() {
    return 'Sent from A ->';
  }
}
class B extends A {
  @override
  String greet() {
    return '${super.greet()} Received from B';
  }
}