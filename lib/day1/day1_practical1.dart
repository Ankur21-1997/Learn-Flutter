import 'package:practice/globleVariable.dart';

/// Take input list -> filter bigger than 1 value -> multiply with 3 -> make it map with index and print

void day1Practical1(List<int> askList){
  List<int> numList = askList;
  List<int> numList10 = [];
  List<int> numList10x3 = [];
  Map<int,dynamic> numMap = {};

  if(numList.isEmpty){
    printF('List Is Empty');
    return;
  }
  printF('Enter List : $numList');
  for(int i=0;i<numList.length;i++){
    if(numList[i]>=10){
      numList10.add(numList[i]);
    }
  }
  printF('Greater than 10 list: $numList10');

  for(int i=0;i<numList10.length;i++){
      numList10x3.add(numList10[i]*3);
  }
  printF('x3 list: $numList10x3');

  for(int i=0;i<numList10x3.length;i++){
    numMap.addEntries([
      MapEntry(i, numList10x3[i])
    ]);
  }
  printF('Final Map: $numMap');

}