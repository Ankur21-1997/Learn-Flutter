import 'package:flutter/material.dart';
import 'package:practice/day1/day1.dart';
import 'package:practice/day2/day2.dart';
import 'package:practice/day3/day3.dart';
import 'package:practice/globleVariable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Home Screen: Title Part'),
          Divider(thickness: 3),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(child: Column(children: listPages())),
                  ),
                  VerticalDivider(thickness: 3),
                  Expanded(flex: 8, child: selectPage()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> listPages() {
    List<Widget> items = [];

    for (int i = 0; i < 30; i++) {
      items.add(
        InkWell(
          child: Text('Day ${i + 1}'),
          onTap: () {
            setState(() {
              selectedPage = i + 1;
            });
            printF('Selected page: Day $selectedPage');
          },
        ),
      );
      items.add(Divider(thickness: 1));
    }

    return items;
  }

  Widget displayPart(){
    return Text('Display Part');
  }

  Widget selectPage(){
    switch (selectedPage) {
      case 0:
        return displayPart();
      case 1:
        return Day1();
      case 2:
        return Day2();
      case 3:
        return Day3();

      default:
        return Center(child: Text("Page Not Found"));
    }
  }
}
