import 'package:practice/globleVariable.dart';

class Student{
  String name;
  int rollNum;

  Student(this.name,this.rollNum);


  Student.details(): name = 'Ankur' , rollNum = 21;

  void printInfo(){
    printF('roll number $rollNum name is $name.');
  }
}

abstract class Shape{
  double area();
  void printArea();
}

class Circle extends Shape {
  final double r;       // only radius

  Circle(this.r);

  @override
  double area() {
    return 3.14 * r * r;   // πr²
  }

  @override
  void printArea() => printF("Circle Area: ${area()}");
}

class Rectangle extends Shape{
  final double h;
  final double w;

  Rectangle(this.w,this.h);

  @override
  double area(){
    return h * w;
  }
  @override
  void printArea() => printF('Rectangle Area: ${area()}');
}

/// Make a factory constructor: parse a json map into a product class
class Product {
  final String id;
  final String name;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });

  // Simple factory constructor to parse JSON Map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }

  // Optional: Convert back to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}

List<Product> parseProducts(List<dynamic> jsonList) {
  return jsonList.map((item) => Product.fromJson(item)).toList();
}
