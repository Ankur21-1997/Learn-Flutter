import 'package:flutter/material.dart';

class Day3 extends StatelessWidget {
  const Day3({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> nameList = [
      "Ankur",
      "Nikhil",
      "Dhruv",
      "Nisarg",
      "Meet",
      "Dipu",
      "Rahul",
      "Karan",
      "Sneha",
      "Riya",
      "Pooja",
      "Vivek",
      "Neha",
      "Ankur",
      "Nikhil",
      "Dhruv",
      "Nisarg",
      "Meet",
      "Dipu",
      "Rahul",
      "Karan",
      "Sneha",
      "Riya",
      "Pooja",
      "Vivek",
      "Neha",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Day 3'),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.redAccent,
                      child: ListView.builder(
                          itemCount: nameList.length,
                          itemBuilder: (context, index) {
                            return Text('$index -> ${nameList[index]}');
                          }
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      color: Colors.orangeAccent,
                      child: GridView.builder(
                        itemCount: nameList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,       // 2 items per row
                          crossAxisSpacing: 5,    // space between columns
                          mainAxisSpacing: 5,     // space between rows
                          childAspectRatio: 2,     // width/height ratio
                        ),
                        itemBuilder: (context, index) {
                          return Text(
                            nameList[index],
                          );
                        },
                      )

                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
